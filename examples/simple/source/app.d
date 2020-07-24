import std;

import bindbc.mecab;

void main()
{
	const support = loadMeCab();
	if (support != MeCabSupport.mecab)
	{
		writeln("Failed to load the library");
		return;
	}
	scope (exit)
		unloadMeCab();

	auto model = mecab_model_new(0, null);
	assert(model);
	scope (exit)
		mecab_model_destroy(model);

	auto tagger = mecab_model_new_tagger(model);
	assert(tagger);
	scope (exit)
		mecab_destroy(tagger);

	auto lattice = mecab_model_new_lattice(model);
	assert(lattice);
	scope (exit)
		mecab_lattice_destroy(lattice);

	auto input = "本日は晴天なり";
	mecab_lattice_set_sentence(lattice, input.toStringz());

	mecab_parse_lattice(tagger, lattice);

	auto node = mecab_lattice_get_bos_node(lattice);
	for (; node; node = node.next)
	{
		writeln(node.surface[0 .. node.length], '\t', node.feature.to!string());
	}
}
