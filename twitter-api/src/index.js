const express = require('express')
require('./db/mongoose')

const app = express()

const userRouter = require('./router/user')
const tweetRouter = require('./router/tweet')
const notificationRouter = require('./router/notification')

const port = process.env.PORT || 3000;

app.use(express.json())
app.use(userRouter)
app.use(tweetRouter)
app.use(notificationRouter)

app.listen(port, ()=> {
    console.log("server is up on the port " + port)
})