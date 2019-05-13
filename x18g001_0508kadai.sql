--■以下のＳＱＬ文を正しく修正しなさい。
--　なお、各テーブルに対して、設計上のミスがあれば指摘しなさい。（コメント内に記述すること）

--１．
DROP TABLE 学生表0508_1;

CREATE TABLE 学生表0508_1(
	クラス CHAR(3) PRIMARY KEY,
	出席番号 CHAR(2) PRIMARY KEY,
	氏名 VARCHAR2(100),
	連絡先 VARCHAR2(10)
);

CREATE TABLE 学生表0508_1(
	クラス CHAR(3),
	出席番号 CHAR(2) ,
	氏名 VARCHAR2(100),
	連絡先 VARCHAR2(11),
	PRIMARY KEY (クラス,出席番号)
);

--▽設計上のミス
--エラーコード: ORA-02260
--詳細: 表には主キーを1つのみ持つことができます
--原因: このエラーの原因は自明です。
--アクション: 余分な主キーを削除してください。



--２．
DROP TABLE 学生表0508_2;

CREATE TABLE 学生表0508_2(
	学籍番号 CHAR(7) PRIMARY KEY,
	氏名 CHAR(12),
	生年月日 DATE,
	部活コード CHAR(3),
	NOT NULL(氏名,生年月日)
);

CREATE TABLE 学生表0508_2(
	学籍番号 CHAR(7) PRIMARY KEY,
	氏名 VARCHAR2(30) NOT NULL,
	生年月日 DATE NOT NULL,
	部活コード CHAR(3)
);

--▽設計上のミス
--★　ワンポイント（教科書p.321）
--　NOT NULL制約は１つの表に必要な行だけ設定できる。
--　列名宣言の行にだけ記述可能


--３．
DROP TABLE 学科表0508;

CREATE TABLE 学科表0508(
	学科コード CHAR(1) PRIMARY KEY,
	学科名 VARCHAR2(100) UNIQUE,
	最高学年 NUMBER NOTNULL,
	CHECK (最高学年 BETWEEN 0 AND 4)
);

CREATE TABLE 学科表0508(
	学科コード CHAR(1) PRIMARY KEY,
	学科名 VARCHAR2(100) UNIQUE NOT NULL,
	最高学年 NUMBER NOT NULL,
	CHECK (最高学年 BETWEEN 0 AND 4)
);

--▽設計上のミス
--NOTNULL
--NOT NULL
--


--４．
DROP TABLE 成績表0508;

CREATE TABLE 成績表0508(
	学籍番号 CHAR(7),
	科目コード CHAR(3)
	テストコード CHAR(3),
	テスト名 VARCHAR2(100),
	得点 NUMBER,
	特記事項 VARCHAR2(600) CHECK (得点 > 0),
	PRIMARY KEY(学籍番号,科目コード,テストコード)
);

CREATE TABLE 成績表0508(
	学籍番号 CHAR(7),
	科目コード CHAR(3),
	テストコード CHAR(3),
	テスト名 VARCHAR2(100),
	得点 NUMBER,
	特記事項 VARCHAR2(600),
	CHECK (得点> 0),
	PRIMARY KEY(学籍番号,科目コード,テストコード)
);

--▽設計上のミス
--テストコード列のカンマない
--varchar2のあとカンマ
--


--５．
DROP TABLE 学生表0508_3;

DROP TABLE 部活表0508;

CREATE TABLE 部活表0508
	部活コード CHAR(1),
	部活名 VARCHAR2(100) NOT NULL,
)

CREATE TABLE 学生表0508_3(
	学籍番号 CHAR(7) PRIMARY KEY.
	氏名 VARCHAR2(100)
	部活番号 CHAR(1) REFERENCES 部活表0508(部活コード)
);


CREATE TABLE 部活表0508(
	部活コード CHAR(1) PRIMARY KEY,
	部活名 VARCHAR2(100) NOT NULL
);

CREATE TABLE 学生表0508_3(
	学籍番号 CHAR(7) PRIMARY KEY,
	氏名 VARCHAR2(100),
	部活番号 CHAR(1) REFERENCES 部活表0508(部活コード)
);

--▽設計上のミス
--0508のあとの(
--NOT NULLのあとのカンマ
--最後のセミコロンない
--主キーになってないとだめらしい?


--６．
DROP TABLE 学生表0508_4;

DROP TABLE 学科表0508_4;--おかしい

DROP TABLE 学科表0508_2;

CREATE TABLE 学科表0508_2(
	学科コード CHAR(3) PRIMARY KEY,
	学科名 CHAR(5) NOT NULL
);

CREATE TABLE 学生表0508_4(
	学籍番号 CHAR(7) PRIMARY KEY,
	学科コード CHAR(4) NOT NULL,
	氏名 VARCHAR2(100),
	FOREIGN KEY REFERENCES 学科表0508_2(学科コード)
); 

CREATE TABLE 学科表0508_2(
	学科コード CHAR(3) PRIMARY KEY,
	学科名 CHAR(5) NOT NULL
);

CREATE TABLE 学生表0508_4(
	学籍番号 CHAR(7) PRIMARY KEY,
	学科コード CHAR(4) NOT NULL,
	氏名 VARCHAR2(100),
	FOREIGN KEY(学科コード) REFERENCES 学科表0508_2(学科コード)
); 

--▽設計上のミス
--FOREIGN KEY に入力すればok?
--DROP TABLEがおかしかった
--


--■以下は設計を考慮して作成すること

--７．以下の情報に基づき、エラーを直した上、作り変えなさい。
-- 学科コード　　：　3桁
-- 学科名　　　　：　「ITエンジニア科3年制」　が入るもの
-- 科長職員番号　：　「090T53」　が入るもの
-- 学科コードは、変更されることがある
-- ２学科を同じ科長が担当することもある

-- なお、驚異的な複数の記述ミスを含みます。
-- いやがらせなの！？と聞きたくなるようなものもあります。
-- 記述ミスを修正し、動く所から始めてみてください。
-- 記述ミスの修復が難しそうでしたら、書き直した方が早くなります。
-- ですが、修正点の指摘ができるとなお良いでしょう。

DROP TABLE 学科表0508_3;


CLEATE TABLE 学科表0508_3
	学科コード VERCHAR2 N0T NULL,
	学科名 VERCHAR2,
	科長職員番号 VERCHAR2 NUT NULL
	UNIQUE(学科コード,科長職員番号)
);

CREATE TABLE 学科表0508_3(
	学科コード CHAR(3) NOT NULL,
	学科名 VARCHAR2(40),
	科長職員番号 CHAR(6) PRIMARY KEY NOT NULL,
	UNIQUE(学科コード,科長職員番号)
);


--８．情報に欠落があり、必要な質問があれば、すること
-- 職員表0508を以下の条件で作成しなさい。
-- 職員コード　：　6桁、主キー
-- 職員名　　　：　日本人のみが在籍できる文字数
-- 入職日　　　：　日付型

DROP TABLE 職員表0508;

CREATE TABLE 職員表0508(
	職員コード CHAR(6) PRIMARY KEY,
	職員名 VARCHAR2(30) NOT NULL,
	入職日 DATE NOT NULL
);

--９．７．で作った学科表0508_3と、８．で作った職員表0508を、外部キーで結びなさい。
-- どちらの表にどんな外部キーを設定すれば良いか、書き換えること
DROP TABLE 学科表0508_3;

CREATE TABLE 学科表0508_3(
	学科コード CHAR(3) NOT NULL,
	学科名 VARCHAR2(40),
	科長職員番号 CHAR(6) PRIMARY KEY NOT NULL,
	UNIQUE(学科コード,科長職員番号)
	
);

DROP TABLE 職員表0508;

CREATE TABLE 職員表0508(
	職員コード CHAR(6) PRIMARY KEY,
	職員名 VARCHAR2(30) NOT NULL,
	入職日 DATE NOT NULL,
	FOREIGN KEY(職員コード) REFERENCES 学科表0508_3(科長職員番号)
);

--10．7．～9．で作った表を削除するには、どちらの表から削除すれば良いか？
-- 以下に正しい順で削除できる DROP TABLE文 を記述しなさい。
１番目DROP TABLE 職員表0508;
２番目DROP TABLE 学科表0508_3;

--11．【自由課題】自身で表の背景を設定し、表を作成しなさい。

DROP TABLE 学生表0508_3;

CREATE TABLE 学生表0508_3(
	学籍コード CHAR(6) NOT NULL,
	氏名 VARCHAR2(40),
	クラス CHAR(3) NOT NULL PRIMARY KEY,
	UNIQUE(学籍コード)
);

DROP TABLE 職員表0508;

CREATE TABLE 職員表0508(
	職員コード CHAR(6) PRIMARY KEY,
	職員名 VARCHAR2(30) NOT NULL,
	クラス CHAR(3) NOT NULL,
	FOREIGN KEY(クラス) REFERENCES 学生表0508_3(クラス)
);

