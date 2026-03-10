const express = require('express');
const { MongoClient } = require('mongodb');

const app = express();
app.use(express.json());

const PORT = process.env.PORT || 3000;
const url = `mongodb://${process.env.KEY_VALUE_USER}:${process.env.KEY_VALUE_PASSWORD}@${process.env.MONGODB_HOST}:27017`;
const dbName = process.env.KEY_VALUE_DB;

let db;

async function connectDB() {
    const client = new MongoClient(url);
    await client.connect();
    console.log("Connected successfully to MongoDB");
    db = client.db(dbName);
}

app.get('/', async (req, res) => {
    const collection = db.collection('keys');
    const docs = await collection.find({}).toArray();
    res.json({ status: "success", data: docs });
});

app.post('/set', async (req, res) => {
    const collection = db.collection('keys');
    const result = await collection.insertOne(req.body);
    res.status(201).json(result);
});

connectDB().then(() => {
    app.listen(PORT, () => console.log(`Backend running on port ${PORT}`));
}).catch(console.error);
