const express = require('express');
const multer = require("multer");
const sharp = require("sharp");
const Tweet = require('../models/tweet');
const auth = require('../middleware/auth');

// New Router
const router = new express.Router();

// Helpers
const upload = multer({
  limits: {
    fileSize: 100000000,
  },
});


// Post a new tweet
router.post('/tweets', auth, async (req, res) => {
    const tweet = new Tweet({
        ...req.body,
        userId: req.user._id,
        username: req.user.username,
        user: req.user._id
    });

    try{
        await tweet.save();
        res.status(201).send(tweet);
    }
    catch (e) {
        res.status(400).send(e);
    }
});

// Add image to tweet
router.post('/uploadTweetImage/:id', auth, upload.single('upload'), async (req, res) => {
    const tweet = await Tweet.findOne({_id: req.params.id})
    if(!tweet){
        return res.status(404).send({error: 'Cannot find the tweet'})
    }
    const buffer = await sharp(req.file.buffer).resize({ width: 350, height: 350 }).png().toBuffer();
    tweet.image = buffer;
    await tweet.save();
    res.send();
}, (error, req, res, next) => {
    res.status(400).send({ error: error.message });
});

// Get all tweets
router.get('/tweets', async (req, res) => {
    try{
        const tweets = await Tweet.find({});
        res.send(tweets);
    } catch (e) {
        res.status(500).send(e);
    }
})

// Fetch Tweet Image
router.get("/tweets/:id/image", async (req, res) => {
  try {
    const tweet = await Tweet.findById(req.params.id);

    if (!tweet && !tweet.image) {
      throw new Error("Image does not exist");
    }

    res.set("Content-Type", "image/png");
    res.send(tweet.image);
  } catch (e) {
    res.status(404).send(e);
  }
});

// Like a Tweet
router.put('/tweets/:id/like', auth, async (req, res) => {
    try{
        const tweet = await Tweet.findById(req.params.id)
        if(!tweet.likes.includes(req.user.id)){
            await tweet.updateOne({ $push: { likes: req.user.id } })
            res.status(200).json('The post has been liked')
        }
        else{
            return res.status(403).json('You have already liked this tweet')
        }
    }
    catch (e) {
        res.status(500).json(e);
    }
});

// Unlike a Tweet
router.put('/tweets/:id/unlike', auth, async (req, res) => {
    try{
        const tweet = await Tweet.findById(req.params.id)
        if(tweet.likes.includes(req.user.id)){
            await tweet.updateOne({ $pull: { likes: req.user.id } })
            res.status(200).json('The post has been unliked')
        }
        else{
            return res.status(403).json('You have not liked this tweet')
        }
    }
    catch (e) {
        res.status(500).json(e);
    }
});

module.exports = router;