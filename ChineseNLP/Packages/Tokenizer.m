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
TokenizerFormat[l_List] := TokenizerFormat /@ l;
TokenizerFormat[str_String] := Block[
	{word, tag, register},
	GrammaticalUnitCheck;
	Quiet[{word, tag} = StringSplit[str, "/"]];
	TextElement[word, <|"GrammaticalUnit" -> Entity["GrammaticalUnitHLP", tag]|>]
];
(* ::Subsubsection:: *)
(*功能块 1*)
(* ::Text:: *)
(*BasicTokenizer*)
classBasicTokenizer := classBasicTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.BasicTokenizer"]];
BasicTokenizer[str_String] := Block[
	{objs, segment, toString},
	objs = JLink`JavaObjectToExpression@classBasicTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerBasic] = {Format -> True};
TokenizerBasic[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@BasicTokenizer[str], BasicTokenizer[str]];
(*功能块 1*)
classStandardTokenizer := classStandardTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.StandardTokenizer"]];
StandardTokenizer[str_String] := Block[
	{objs, segment, toString},
	objs = JLink`JavaObjectToExpression@classStandardTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerStandard] = {Format -> True};
TokenizerStandard[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@StandardTokenizer[str], StandardTokenizer[str]];
(*功能块 1*)
classIndexTokenizer := classIndexTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.IndexTokenizer"]];
IndexTokenizer[str_String] := Block[
	{objs, segment, toString},
	objs = JLink`JavaObjectToExpression@classIndexTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerIndex] = {Format -> True};
TokenizerIndex[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@IndexTokenizer[str], IndexTokenizer[str]];
(*功能块 1*)
classNLPTokenizer := classNLPTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.NLPTokenizer"]];
NLPTokenizer[str_String] := Block[
	{objs, segment, toString},
	objs = JLink`JavaObjectToExpression@classNLPTokenizer@segment[str];
	Through[objs@toString[]]
];
Options[TokenizerNLP] = {Format -> True};
TokenizerNLP[str_, OptionsPattern[]] := If[TrueQ@OptionValue[Format], TokenizerFormat@NLPTokenizer[str], NLPTokenizer[str]];
(*功能块 1*)
classNLPTokenizer := classNLPTokenizer = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.tokenizer.SpeedTokenizer"]];
SpeedTokenizer[str_String] := Block[
	{objs, segment, toString},
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
