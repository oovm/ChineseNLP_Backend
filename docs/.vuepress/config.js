module.exports = {
	dest: 'docs/.build',
	locales: {
		'/': {
			lang: 'zh-CN',
			title: 'ChineseNLP',
			description: 'Mega NLP Tools Kits.'
		}
	},
	head: [
		['link', {rel: 'stylesheet', href: 'https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.5.1/katex.min.css'}]
	],
	themeConfig: {
		repo: 'GalAster/ChineseNLP',
		editLinks: true,
		docsDir: 'docs',
		markdown: {
			lineNumbers: true
		},
		sidebar: [
			{
				title: '开发文档',
				children: [
					'/Start/',
					'/Start/Developer.md',
					'/Start/Editor.md',
					'/Start/EditorAdv.md'
				]
			},
			{
				title: '信息提取模块',
				children: [
					'/Extracter/'
				]
			},
			{
				title: '分词标注模块',
				children: [
					'/Tokenizer/'
				]
			},
			{
				title: '语言转化模块',
				children: [
					'/Translater/'
				]
			},
			{
				title: '句法分析模块',
				children: [
					'/Analyzer/'
				]
			}
		]
	},
	serviceWorker: true
};
