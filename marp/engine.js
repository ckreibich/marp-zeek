// This is largely based on https://github.com/orgs/marp-team/discussions/422

const { Marp } = require('@marp-team/marp-core')
const hljs = require('highlight.js')
const zeek = require('./highlightjs-zeek.js');

hljs.registerLanguage('zeek', zeek);

class CustomMarp extends Marp {
    constructor(opts) {
        super(opts);
    }

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

module.exports = CustomMarp
