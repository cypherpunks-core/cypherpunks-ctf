require("dotenv").config()
const Web3 = require("web3")
const request = require("request")
const fs = require("fs")

const { url, infura, receiver } = process.env
const web3 = new Web3()
web3.setProvider(new web3.providers.HttpProvider("https://ropsten.infura.io/v3/" + infura))

function writeLog(log) {
  const d = new Date()
  const datestring = (d.getMonth() + 1) + "-" + d.getDate() + "-" + d.getFullYear() + " " + d.getHours() + ":" + d.getMinutes() + " "

  fs.appendFileSync("withdraw.log", datestring + " " + log + "\n")
}

function rand(upperBound) {
  return Math.floor(Math.random() * Math.floor(upperBound))
}

function generateRandIP() {
  let ip = ""
  for (let i = 0; i < 4; i++) {
    if (i) ip += "."
    ip += rand(256).toString()
  }
  return ip
}

async function waitUntilMined(hash) {
  return new Promise(async(resolve, reject) => {
    const interval = setInterval(async() => {
      const receipt = await web3.eth.getTransactionReceipt(hash)
      if (receipt != null) {
        clearInterval(interval)
        resolve(receipt)
      }
    }, 60000)
  })
}

function handleResponse(err, res, body) {
  if (err) {
    writeLog("Error: " + err)
  } else if (res.statusCode !== 200) {
    writeLog("Error code" + res.statusCode + ": " + body)
  } else {
    const info = JSON.parse(body)
    // Wait 3 minutes
    setTimeout(() => {
      web3.eth.sendTransaction({
        from: info.address,
        to: receiver,
        value: "1499000000000000000",
        gasPrice: "10000000000",
        gas: "21000"
      }).on("transactionHash", function(hash) {
        writeLog("Success: " + hash)
      })
    }, 180 * 1000) 
  }
}

function buildRequest(address, callback) {
  const options = {
    url: url + address,
    method: "GET",
    headers: {
      "x-forwarded-for": generateRandIP()
    }
  }
 
  request(options, callback)
}

function createAccount() {
  const account = web3.eth.accounts.create()
  return account
}

setInterval(() => {
  const account = createAccount()
  web3.eth.accounts.wallet.add(account)
  buildRequest(account.address, handleResponse) 
}, 5000) // 5 sec
