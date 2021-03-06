split = require 'split'

counts = {}

process.stdin.setEncoding 'utf8'

process.stdin.pipe(split()).on 'data', (line) ->
  (line.toLowerCase().match(/[a-z\']+/g) || []).forEach (word) ->
    counts[word] = (counts[word] || 0) + 1

process.stdin.on 'end', (line) ->
  Object.keys(counts).sort().forEach (word) ->
    console.log '%s %d', word, counts[word]
