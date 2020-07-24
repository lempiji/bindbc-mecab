module bindbc.mecab;

public import bindbc.mecab.types;

version(BindBC_Static) version = BindMeCab_Static;
else version = BindMeCab_Dynamic;

version(BindMeCab_Static) public import bindbc.mecab.bindstatic;
else public import bindbc.mecab.binddynamic;