(* ::Package:: *)
(* ::Title:: *)
(*Tokenizer(Tokenizer)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-08-30*)
(*Copyright: Mozilla Public License Version 2.0*)
(* ::Program:: *)
(*1.软件产品再发布时包含一份原始许可声明和版权声明。*)
(*2.提供快速的专利授权。*)
(*3.不得使用其原始商标。*)
(*4.如果修改了源代码，包含一份代码修改说明。*)
(**)
(* ::Text:: *)
(*这里应该填这个函数的介绍*)
(* ::Section:: *)
(*函数说明*)
ExampleFunction::usage = "这里应该填这个函数的说明,如果要换行用\"\\r\"\r就像这样";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
ExNumber::usage = "程序包的说明,这里抄一遍";
Begin["`Tokenizer`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$Tokenizer = "V1.0";
Updated$Tokenizer = "2018-08-30";
(* ::Subsubsection:: *)
(*功能块 2*)
TokenizerFormat[l_List] := TokenizerFormat /@ l;
TokenizerFormat[str_] := Block[
	{word, tag},
	{word, tag} = StringSplit[str, "/"];
	Switch[tag,
		"v", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Verb"]|>],
		"n", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Noun"]|>],
		"a", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Adjective"]|>],
		"p", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Preposition"]|>],
		"d", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Adverb"]|>],
		"nz", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "ProperNoun"]|>],
		"w", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Punctuation"]|>],
		"mq", TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "QuantifierPhrase"]|>],
		_, TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Symbol"]|>]
	]
];
(* ::Subsubsection:: *)
(*功能块 1*)
classBasicTokenizer = JavaNew[LoadJavaClass["com.hankcs.hanlp.tokenizer.BasicTokenizer"]];
BasicTokenizer[str_] := Block[
	{objs, segment, toString},
	objs = JavaObjectToExpression@classBasicTokenizer@segment[str];
	Through[objs@toString[]]
];
classStandardTokenizer = JavaNew[LoadJavaClass["com.hankcs.hanlp.tokenizer.StandardTokenizer"]];
StandardTokenizer[str_] := Block[
	{objs, segment, toString},
	objs = JavaObjectToExpression@classStandardTokenizer@segment[str];
	Through[objs@toString[]]
];
classIndexTokenizer = JavaNew[LoadJavaClass["com.hankcs.hanlp.tokenizer.IndexTokenizer"]];
IndexTokenizer[str_] := Block[
	{objs, segment, toString},
	objs = JavaObjectToExpression@classIndexTokenizer@segment[str];
	Through[objs@toString[]]
];
classNLPTokenizer = JavaNew[LoadJavaClass["com.hankcs.hanlp.tokenizer.NLPTokenizer"]];
NLPTokenizer[str_] := Block[
	{objs, segment, toString},
	objs = JavaObjectToExpression@classNLPTokenizer@segment[str];
	Through[objs@toString[]]
];

(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{ },
	{Protected, ReadProtected}
]
End[]