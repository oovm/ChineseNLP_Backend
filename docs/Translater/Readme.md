# Functions

语言转换模块

## ToSimplifiedChinese

```haskell
ToSimplifiedChinese["\
	龍門縣圖書館負1樓倉庫內儲書3萬餘冊，這週計劃將書櫃從單層擴爲雙層。
	門衛檢舉財務處處長順機貪汙。
	館長細細詢問，發現會計將壞賬隱於倉庫裏幾冊連環畫夾層內，難覓證據。
	報給縣長，縣長聽聞，親領幾個夥計騎電動車來倉庫，開櫃驗視，終獲賬單數張，數額逹萬圓。
	經確認，實爲會計筆跡，證據確鑿。
	後於會議廳內將處長與會計緝獲，當時處長準備開會時尋機會脫竄。
	羣衆圍觀稱讚。\
", Method -> "TW"]
```

```
作者：匿名用户
链接：https://www.zhihu.com/question/285084240/answer/485030863
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```

![](https://i.loli.net/2018/09/07/5b929426ade44.png)


## ToTraditionalChinese

```haskell
ToTraditionalChinese["\
	一只忧郁的台湾乌龟寻衅几群肮脏变态啮齿鳄鳖，
	几群肮脏变态啮齿鳄鳖围殴一只忧郁台湾乌龟，\
", Method -> "TW"] // Text
```

![](https://i.loli.net/2018/09/07/5b9294267335b.png)

能正确的处理两岸说法不同的词汇:

```haskell
ToTraditionalChinese["内存条", Method -> "TW"]
ToTraditionalChinese["内存条", Method -> "HK"]
ToTraditionalChinese["内存条", Method -> "FT"]
```

![](https://i.loli.net/2018/09/07/5b929426725c0.png)


## ToPinYing

能同时判定简体以及繁体字

```haskell
ToPinyin["苟利国家生死以,豈因禍福避趨之?", 1]
ToPinyin["苟利国家生死以,豈因禍福避趨之?", 2]
ToPinyin["苟利国家生死以,豈因禍福避趨之?", 3]
ToPinyin["苟利国家生死以,豈因禍福避趨之?", 4]
ToPinyin["苟利国家生死以,豈因禍福避趨之?", 5]
ToPinyin["苟利国家生死以,豈因禍福避趨之?", 6]
```
![](https://i.loli.net/2018/09/07/5b929803a4aa3.png)

```haskell
ToPinyin["苟利国家生死以,豈因禍福避趨之?", 7]
```

![](https://i.loli.net/2018/09/07/5b929803cb16f.png)

实际调用了 `PinyinDecompose` 函数生成一个字典.
