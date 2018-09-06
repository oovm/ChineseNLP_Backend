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
TokenizerBasic::usage = "";
TokenizerStandard::usage = "";
TokenizerIndex::usage = "";
TokenizerNLP::usage = "";
TokenizerFormat::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Begin["`Tokenizer`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$Tokenizer = "V1.0";
Updated$Tokenizer = "2018-08-30";
(* ::Subsubsection:: *)
(*GrammaticalUnitHLP*)
EntityStore["GrammaticalUnitHLP" -> <|
	"Entities" -> <|
		"Ag" -> <|"Name" -> "形语素", "Tag" -> "Ag", "Description" -> "形容词性语素。形容词代码为a，语素代码ｇ前面置以A。"|>,
		"a" -> <|"Name" -> "形容词", "Tag" -> "a", "Description" -> "取英语形容词adjective的第1个字母"|>,
		"ad" -> <|"Name" -> "副形词", "Tag" -> "ad", "Description" -> "直接作状语的形容词。形容词代码a和副词代码d并在一起。"|>,
		"an" -> <|"Name" -> "名形词", "Tag" -> "an", "Description" -> "具有名词功能的形容词。形容词代码a和名词代码n并在一起。"|>,
		"Bg" -> <|"Name" -> "区别语素", "Tag" -> "Bg", "Description" -> "区别词性语素。区别词代码为b，语素代码ｇ前面置以B。"|>,
		"b" -> <|"Name" -> "区别词", "Tag" -> "b", "Description" -> "取汉字\"别\"的声母。"|>,
		"c" -> <|"Name" -> "连词", "Tag" -> "c", "Description" -> "取英语连词conjunction的第1个字母。"|>,
		"Dg" -> <|"Name" -> "副语素", "Tag" -> "Dg", "Description" -> "副词性语素。副词代码为d，语素代码ｇ前面置以D。"|>,
		"d" -> <|"Name" -> "副词", "Tag" -> "d", "Description" -> "取adverb的第2个字母，因其第1个字母已用于形容词。"|>,
		"e" -> <|"Name" -> "叹词", "Tag" -> "e", "Description" -> "取英语叹词exclamation的第1个字母。"|>,
		"f" -> <|"Name" -> "方位词", "Tag" -> "f", "Description" -> "取汉字\"方\"。"|>,
		"h" -> <|"Name" -> "前接成分", "Tag" -> "h", "Description" -> "取英语head的第1个字母。"|>,
		"i" -> <|"Name" -> "成语", "Tag" -> "i", "Description" -> "取英语成语idiom的第1个字母。"|>,
		"j" -> <|"Name" -> "简称略语", "Tag" -> "j", "Description" -> "取汉字\"简\"的声母。"|>,
		"k" -> <|"Name" -> "后接成分", "Tag" -> "k", "Description" -> "后接成分。"|>,
		"l" -> <|"Name" -> "习用语", "Tag" -> "l", "Description" -> "习用语尚未成为成语，有点\"临时性\"，取\"临\"的声母。"|>,
		"Mg" -> <|"Name" -> "数语素", "Tag" -> "Mg", "Description" -> "数词性语素。数词代码为m，语素代码ｇ前面置以M。"|>,
		"m" -> <|"Name" -> "数词", "Tag" -> "m", "Description" -> "取英语numeral的第3个字母，n，u已有他用。"|>,
		"Ng" -> <|"Name" -> "名语素", "Tag" -> "Ng", "Description" -> "名词性语素。名词代码为n，语素代码ｇ前面置以N。"|>,
		"n" -> <|"Name" -> "名词", "Tag" -> "n", "Description" -> "取英语名词noun的第1个字母。"|>,
		"nr" -> <|"Name" -> "人名", "Tag" -> "nr", "Description" -> "名词代码n和\"人(ren)\"的声母并在一起。"|>,
		"ns" -> <|"Name" -> "地名", "Tag" -> "ns", "Description" -> "名词代码n和处所词代码s并在一起。"|>,
		"nt" -> <|"Name" -> "机构团体", "Tag" -> "nt", "Description" -> "\"团\"的声母为t，名词代码n和t并在一起。"|>,
		"nx" -> <|"Name" -> "外文字符", "Tag" -> "nx", "Description" -> "外文字符。"|>,
		"nz" -> <|"Name" -> "其他专名", "Tag" -> "nz", "Description" -> "\"专\"的声母的第1个字母为z，名词代码n和z并在一起。"|>,
		"o" -> <|"Name" -> "拟声词", "Tag" -> "o", "Description" -> "取英语拟声词onomatopoeia的第1个字母。"|>,
		"p" -> <|"Name" -> "介词", "Tag" -> "p", "Description" -> "取英语介词prepositional的第1个字母。"|>,
		"q" -> <|"Name" -> "量词", "Tag" -> "q", "Description" -> "取英语quantity的第1个字母。"|>,
		"Rg" -> <|"Name" -> "代语素", "Tag" -> "Rg", "Description" -> "代词性语素。代词代码为r，在语素的代码g前面置以R。"|>,
		"r" -> <|"Name" -> "代词", "Tag" -> "r", "Description" -> "取英语代词pronoun的第2个字母，因p已用于介词。"|>,
		"s" -> <|"Name" -> "处所词", "Tag" -> "s", "Description" -> "取英语space的第1个字母。"|>,
		"Tg" -> <|"Name" -> "时语素", "Tag" -> "Tg", "Description" -> "时间词性语素。时间词代码为t，在语素的代码g前面置以T。"|>,
		"t" -> <|"Name" -> "时间词", "Tag" -> "t", "Description" -> "取英语time的第1个字母。"|>,
		"u" -> <|"Name" -> "助词", "Tag" -> "u", "Description" -> "取英语助词auxiliary。"|>,
		"Vg" -> <|"Name" -> "动语素", "Tag" -> "Vg", "Description" -> "动词性语素。动词代码为v。在语素的代码g前面置以V。"|>,
		"v" -> <|"Name" -> "动词", "Tag" -> "v", "Description" -> "取英语动词verb的第一个字母。"|>,
		"vd" -> <|"Name" -> "副动词", "Tag" -> "vd", "Description" -> "直接作状语的动词。动词和副词的代码并在一起。"|>,
		"vn" -> <|"Name" -> "名动词", "Tag" -> "vn", "Description" -> "指具有名词功能的动词。动词和名词的代码并在一起。"|>,
		"w" -> <|"Name" -> "标点符号", "Tag" -> "w", "Description" -> ""|>,
		"x" -> <|"Name" -> "非语素字", "Tag" -> "x", "Description" -> "非语素字只是一个符号，字母x通常用于代表未知数、符号。"|>,
		"Yg" -> <|"Name" -> "语气语素", "Tag" -> "Yg", "Description" -> "语气词性语素。语气词代码为y。在语素的代码g前面置以Y。"|>,
		"y" -> <|"Name" -> "语气词", "Tag" -> "y", "Description" -> "取汉字\"语\"的声母。"|>,
		"z" -> <|"Name" -> "状态词", "Tag" -> "z", "Description" -> "取汉字\"状\"的声母的前一个字母。"|>
	|>
|>
] // EntityRegister;
GrammaticalUnitHLPCheck := If[
	!AssociationQ@NaturalLanguageProcessing`PackageScope`TagNameAssoc,
	TextElement["Ready", <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Adjective"]|>];
	GrammaticalUnitHLPCheck,
	AssociateTo[
		NaturalLanguageProcessing`PackageScope`TagNameAssoc,
		# -> Style[#["Name"], 12]& /@ EntityList["GrammaticalUnitHLP"]
	];
];
TokenizerFormat[l_List] := TokenizerFormat /@ l;
TokenizerFormat[str_] := Block[
	{word, tag, register},
	GrammaticalUnitHLPCheck;
	Quiet[{word, tag} = StringSplit[str, "/"]];
	TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnitHLP", tag]|>]
];
(* ::Subsubsection:: *)
(*功能块 1*)
(* ::Text:: *)
(*BasicTokenizer*)
BasicTokenizer[str_] := Block[
	{objs, segment, toString},
	classBasicTokenizer := classBasicTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.BasicTokenizer"]];
	objs = JLink`JavaObjectToExpression@classBasicTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerBasic] = {Format -> True};
TokenizerBasic[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@BasicTokenizer[str], BasicTokenizer[str]];
(*功能块 1*)
StandardTokenizer[str_] := Block[
	{objs, segment, toString},
	classStandardTokenizer := classStandardTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.StandardTokenizer"]];
	objs = JLink`JavaObjectToExpression@classStandardTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerStandard] = {Format -> True};
TokenizerStandard[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@StandardTokenizer[str], StandardTokenizer[str]];
(*功能块 1*)
IndexTokenizer[str_] := Block[
	{objs, segment, toString},
	classIndexTokenizer := classIndexTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.IndexTokenizer"]];
	objs = JLink`JavaObjectToExpression@classIndexTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerIndex] = {Format -> True};
TokenizerIndex[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@IndexTokenizer[str], IndexTokenizer[str]];
(*功能块 1*)
NLPTokenizer[str_] := Block[
	{objs, segment, toString},
	classNLPTokenizer := classNLPTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.NLPTokenizer"]];
	objs = JLink`JavaObjectToExpression@classNLPTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerNLP] = {Format -> True};
TokenizerNLP[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@NLPTokenizer[str], NLPTokenizer[str]];
(*功能块 1*)
SpeedTokenizer[str_] := Block[
	{objs, segment, toString},
	classNLPTokenizer := classNLPTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.SpeedTokenizer"]];
	objs = JLink`JavaObjectToExpression@classNLPTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerSpeed] = {Format -> True};
TokenizerSpeed[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@SpeedTokenizer[str], NLPTokenizer[str]];
(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{ },
	{Protected, ReadProtected}
];
End[]
