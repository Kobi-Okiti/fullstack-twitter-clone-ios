const express = require('express');
const Tweet = require('../models/tweet');
const auth = require('../middleware/auth');

// New Router
const router = new express.Router();

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

module.exports = router;