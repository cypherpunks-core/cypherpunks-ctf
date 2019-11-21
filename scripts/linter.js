const path = require("path")
const fs = require("fs")
const chalk = require("chalk")

const ignore = [/node_modules/]
let jsonCount = 0
let jsonPass = 0

function fromDir(startPath, filter, callback) {
  if (!fs.existsSync(startPath)) {
    throw `Directory ${startPath} not found`
  }

  const files = fs.readdirSync(startPath)
  for (let i = 0; i < files.length; i++) {
    const filename = path.join(startPath, files[i])

    let shouldIgnore = 0
    for (let j = 0; j < ignore.length; j++) {
      if (ignore[j].test(filename)) {
        shouldIgnore = 1
        break
      }
    }
    if (shouldIgnore)
      continue

    const stat = fs.lstatSync(filename)
    if (stat.isDirectory()) {
      fromDir(filename, filter, callback)
    } else if (filter.test(filename)) {
      callback(filename)
    }
  }
}

function jsonChecker(filename) {
  // Use process.stdout.write to avoid trailing newline
  process.stdout.write("Checking and auto formatting " + filename + ":")
  jsonCount += 1
  const content = fs.readFileSync(filename)
  try {
    const jsonContent = JSON.parse(content)
    // Indent with 2 spaces
    const jsonObj = JSON.stringify(jsonContent, null, 2)
    fs.writeFileSync(filename, jsonObj)
    process.stdout.write(chalk.green(" Pass!\n"))
    jsonPass += 1
  } catch (err) {
    console.log("\n" + chalk.red(err))   
  }
}

fromDir(".", /\.json$/, jsonChecker)

console.log("\nTotal:", jsonCount)
console.log(chalk.green("Pass: " + jsonPass))
console.log(chalk.red("Fail: " + (jsonCount - jsonPass)))
