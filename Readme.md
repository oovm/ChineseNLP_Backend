# ChineseNLP

![Release Vision](https://img.shields.io/badge/release-failed-ff0000.svg)
![Repo Size](https://img.shields.io/github/repo-size/GalAster/ChineseNLP.svg)
![Code Size](https://img.shields.io/github/languages/code-size/GalAster/ChineseNLP.svg)

## Introduction

现阶段主要使用现有的库, 以后会逐渐转向原生实现.

- HanLP: https://github.com/hankcs/HanLP
- Chinese-Word-Vectors: https://github.com/Embedding/Chinese-Word-Vectors
- ELMoForManyLangs: https://github.com/HIT-SCIR/ELMoForManyLangs

## System Requirements

该项目不会特意向下兼容低版本与低配, 请至少满足以下环境要求:

![Mathematica](https://img.shields.io/badge/Mathematica-%3E%3D11.3-brightgreen.svg)
![JRE](https://img.shields.io/badge/JRE-%3E%3D1.7-green.svg)
![UTF8](https://img.shields.io/badge/Encode-UTF8-red.svg)

建议 `$UserBaseDirectory` 所在磁盘空间大于 4G 以存放模型和缓存, 可用内存大于1G以加载模型.

另外部分功能需要用到 Mathematica 深度学习框架, 建议配置独立显卡.
