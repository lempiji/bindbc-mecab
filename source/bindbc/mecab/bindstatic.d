module bindbc.mecab.bindstatic;

version (BindMeCab_Static) :

public import bindbc.mecab.types;

extern (C) @nogc nothrow:

/* C interface */
/* old mecab interface */
/**
 * C wrapper of MeCab::Tagger::create(argc, argv)
 */
mecab_t* mecab_new(int argc, char** argv);

/**
 * C wrapper of MeCab::Tagger::create(arg)
 */
mecab_t* mecab_new2(const(char)* arg);

/**
 * C wrapper of MeCab::Tagger::version()
 */
const(char)* mecab_version();

/**
 * C wrapper of MeCab::getLastError()
 */
const(char)* mecab_strerror(mecab_t* mecab);

/**
 * C wrapper of MeCab::deleteTagger(tagger)
 */
void mecab_destroy(mecab_t* mecab);

/**
 *C wrapper of MeCab::Tagger:set_partial()
 */
int mecab_get_partial(mecab_t* mecab);

/**
 * C wrapper of MeCab::Tagger::partial()
 */
void mecab_set_partial(mecab_t* mecab, int partial);

/**
 * C wrapper of MeCab::Tagger::theta()
 */
float mecab_get_theta(mecab_t* mecab);

/**
 * C wrapper of  MeCab::Tagger::set_theta()
 */
void mecab_set_theta(mecab_t* mecab, float theta);

/**
 * C wrapper of MeCab::Tagger::lattice_level()
 */
int mecab_get_lattice_level(mecab_t* mecab);

/**
 * C wrapper of MeCab::Tagger::set_lattice_level()
 */
void mecab_set_lattice_level(mecab_t* mecab, int level);

/**
 * C wrapper of MeCab::Tagger::all_morphs()
 */
int mecab_get_all_morphs(mecab_t* mecab);

/**
 * C wrapper of MeCab::Tagger::set_all_moprhs()
 */
void mecab_set_all_morphs(mecab_t* mecab, int all_morphs);

/**
 * C wrapper of MeCab::Tagger::parse(MeCab::Lattice *lattice)
 */
int mecab_parse_lattice(mecab_t* mecab, mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Tagger::parse(char *str)
 */
const(char)* mecab_sparse_tostr(mecab_t* mecab, const(char)* str);

/**
 * C wrapper of MeCab::Tagger::parse(char *str, size_t len)
 */
const(char)* mecab_sparse_tostr2(mecab_t* mecab, const(char)* str, size_t len);

/**
 * C wrapper of MeCab::Tagger::parse(char *str, char *ostr, size_t olen)
 */
const(char)* mecab_sparse_tostr3(mecab_t* mecab, const(char)* str, size_t len, char* ostr, size_t olen);

/**
 * C wrapper of MeCab::Tagger::parseToNode(char *str)
 */
const(mecab_node_t)* mecab_sparse_tonode(mecab_t* mecab, const(char)*);

/**
 * C wrapper of MeCab::Tagger::parseToNode(char *str, size_t len)
 */
const(mecab_node_t)* mecab_sparse_tonode2(mecab_t* mecab, const(char)*, size_t);

/**
 * C wrapper of MeCab::Tagger::parseNBest(size_t N, char *str)
 */
const(char)* mecab_nbest_sparse_tostr(mecab_t* mecab, size_t N, const(char)* str);

/**
 * C wrapper of MeCab::Tagger::parseNBest(size_t N, char *str, size_t len)
 */
const(char)* mecab_nbest_sparse_tostr2(mecab_t* mecab, size_t N, const(char)* str, size_t len);

/**
 * C wrapper of MeCab::Tagger::parseNBest(size_t N, char *str, char *ostr, size_t olen)
 */
const(char)* mecab_nbest_sparse_tostr3(mecab_t* mecab, size_t N, const(char)* str, size_t len,
        char* ostr, size_t olen);

/**
 * C wrapper of MeCab::Tagger::parseNBestInit(char *str)
 */
int mecab_nbest_init(mecab_t* mecab, const(char)* str);

/**
 * C wrapper of MeCab::Tagger::parseNBestInit(char *str, size_t len)
 */
int mecab_nbest_init2(mecab_t* mecab, const(char)* str, size_t len);

/**
 * C wrapper of MeCab::Tagger::next()
 */
const(char)* mecab_nbest_next_tostr(mecab_t* mecab);

/**
 * C wrapper of MeCab::Tagger::next(char *ostr, size_t olen)
 */
char* mecab_nbest_next_tostr2(mecab_t* mecab, char* ostr, size_t olen);

/**
 * C wrapper of MeCab::Tagger::nextNode()
 */
const(mecab_node_t)* mecab_nbest_next_tonode(mecab_t* mecab);

/**
 * C wrapper of MeCab::Tagger::formatNode(const Node *node)
 */
const(char)* mecab_format_node(mecab_t* mecab, const(mecab_node_t)* node);

/**
 * C wrapper of MeCab::Tagger::dictionary_info()
 */
const(mecab_dictionary_info_t)* mecab_dictionary_info(mecab_t* mecab);

/* lattice interface */
/**
 * C wrapper of MeCab::createLattice()
 */
mecab_lattice_t* mecab_lattice_new();

/**
 * C wrapper of MeCab::deleteLattice(lattice)
 */
void mecab_lattice_destroy(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::clear()
 */
void mecab_lattice_clear(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::is_available()
 */
int mecab_lattice_is_available(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::bos_node()
 */
mecab_node_t* mecab_lattice_get_bos_node(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::eos_node()
 */
mecab_node_t* mecab_lattice_get_eos_node(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::begin_nodes()
 */
mecab_node_t** mecab_lattice_get_all_begin_nodes(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::end_nodes()
 */
mecab_node_t** mecab_lattice_get_all_end_nodes(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::begin_nodes(pos)
 */
mecab_node_t* mecab_lattice_get_begin_nodes(mecab_lattice_t* lattice, size_t pos);

/**
 * C wrapper of MeCab::Lattice::end_nodes(pos)
 */
mecab_node_t* mecab_lattice_get_end_nodes(mecab_lattice_t* lattice, size_t pos);

/**
 * C wrapper of MeCab::Lattice::sentence()
 */
char* mecab_lattice_get_sentence(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::set_sentence(sentence)
 */
void mecab_lattice_set_sentence(mecab_lattice_t* lattice, const(char)* sentence);

/**
 * C wrapper of MeCab::Lattice::set_sentence(sentence, len)
 */
void mecab_lattice_set_sentence2(mecab_lattice_t* lattice, const(char)* sentence, size_t len);

/**
 * C wrapper of MeCab::Lattice::size()
 */
size_t mecab_lattice_get_size(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::Z()
 */
double mecab_lattice_get_z(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::set_Z()
 */
void mecab_lattice_set_z(mecab_lattice_t* lattice, double Z);

/**
 * C wrapper of MeCab::Lattice::theta()
 */
double mecab_lattice_get_theta(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::set_theta()
 */
void mecab_lattice_set_theta(mecab_lattice_t* lattice, double theta);

/**
 * C wrapper of MeCab::Lattice::next()
 */
int mecab_lattice_next(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::request_type()
 */
int mecab_lattice_get_request_type(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::has_request_type()
 */
int mecab_lattice_has_request_type(mecab_lattice_t* lattice, int request_type);

/**
 * C wrapper of MeCab::Lattice::set_request_type()
 */
void mecab_lattice_set_request_type(mecab_lattice_t* lattice, int request_type);

/**
 * C wrapper of MeCab::Lattice::add_request_type()
 */
void mecab_lattice_add_request_type(mecab_lattice_t* lattice, int request_type);

/**
 * C wrapper of MeCab::Lattice::remove_request_type()
 */
void mecab_lattice_remove_request_type(mecab_lattice_t* lattice, int request_type);

/**
 * C wrapper of MeCab::Lattice::newNode();
 */
mecab_node_t* mecab_lattice_new_node(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::toString()
 */
const(char)* mecab_lattice_tostr(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::toString(buf, size)
 */
const(char)* mecab_lattice_tostr2(mecab_lattice_t* lattice, char* buf, size_t size);

/**
 * C wrapper of MeCab::Lattice::enumNBestAsString(N)
 */
const(char)* mecab_lattice_nbest_tostr(mecab_lattice_t* lattice, size_t N);

/**
 * C wrapper of MeCab::Lattice::enumNBestAsString(N, buf, size)
 */
const(char)* mecab_lattice_nbest_tostr2(mecab_lattice_t* lattice, size_t N, char* buf, size_t size);

/**
 * C wrapper of MeCab::Lattice::has_constraint()
 */
int mecab_lattice_has_constraint(mecab_lattice_t* lattice);

/**
 * C wrapper of MeCab::Lattice::boundary_constraint(pos)
 */
int mecab_lattice_get_boundary_constraint(mecab_lattice_t* lattice, size_t pos);

/**
 * C wrapper of MeCab::Lattice::feature_constraint(pos)
 */
const(char)* mecab_lattice_get_feature_constraint(mecab_lattice_t* lattice, size_t pos);

/**
 * C wrapper of MeCab::Lattice::boundary_constraint(pos, type)
 */
void mecab_lattice_set_boundary_constraint(mecab_lattice_t* lattice, size_t pos, int boundary_type);

/**
 * C wrapper of MeCab::Lattice::set_feature_constraint(begin_pos, end_pos, feature)
 */
void mecab_lattice_set_feature_constraint(mecab_lattice_t* lattice,
        size_t begin_pos, size_t end_pos, const(char)* feature);

/**
 * C wrapper of MeCab::Lattice::what()
 */
const(char)* mecab_lattice_strerror(mecab_lattice_t* lattice);

/* model interface */
/**
 * C wapper of MeCab::Model::create(argc, argv)
 */
mecab_model_t* mecab_model_new(int argc, char** argv);

/**
 * C wapper of MeCab::Model::create(arg)
 */
mecab_model_t* mecab_model_new2(char* arg);

/**
 * C wapper of MeCab::deleteModel(model)
 */
void mecab_model_destroy(mecab_model_t* model);

/**
 * C wapper of MeCab::Model::createTagger()
 */
mecab_t* mecab_model_new_tagger(mecab_model_t* model);

/**
 * C wapper of MeCab::Model::createLattice()
 */
mecab_lattice_t* mecab_model_new_lattice(mecab_model_t* model);

/**
 * C wrapper of MeCab::Model::swap()
 */
int mecab_model_swap(mecab_model_t* model, mecab_model_t* new_model);

/**
 * C wapper of MeCab::Model::dictionary_info()
 */
const(mecab_dictionary_info_t)* mecab_model_dictionary_info(mecab_model_t* model);

/**
 * C wrapper of MeCab::Model::transition_cost()
 */
int mecab_model_transition_cost(mecab_model_t* model, ushort rcAttr, ushort lcAttr);

/**
 * C wrapper of MeCab::Model::lookup()
 */
mecab_node_t* mecab_model_lookup(mecab_model_t* model, const(char)* begin, const(char)* end,
        mecab_lattice_t* lattice);

/* static functions */
int mecab_do(int argc, char** argv);
int mecab_dict_index(int argc, char** argv);
int mecab_dict_gen(int argc, char** argv);
int mecab_cost_train(int argc, char** argv);
int mecab_system_eval(int argc, char** argv);
int mecab_test_gen(int argc, char** argv);
