// This is largely based on https://github.com/orgs/marp-team/discussions/422

const { Marp } = require('@marp-team/marp-core')
const hljs = require('highlight.js')
const zeek = require('./highlightjs-zeek.js');

globalThis.hljs = hljs
hljs.registerLanguage('zeek', zeek);

module.exports = class CustomMarp extends Marp {
    highlighter(code, lang, _attrs) {
        if (lang && hljs.getLanguage(lang)) {
            return hljs.highlight(code, {
                language: lang,
                ignoreIllegals: true,
            }).value
        }
        return ''
    }
}
