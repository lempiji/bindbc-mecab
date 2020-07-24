module bindbc.mecab.binddynamic;

version (BindMeCab_Static)
{
}
else version = BindMeCab_Dynamic;

version (BindMeCab_Dynamic)  : public import bindbc.mecab.types;

private import bindbc.loader;

extern (C) @nogc nothrow:

__gshared
{
    /* C interface */
    /* old mecab interface */
    /**
     * C wrapper of MeCab::Tagger::create(argc, argv)
     */
    mecab_t* function(int argc, char** argv) mecab_new;

    /**
     * C wrapper of MeCab::Tagger::create(arg)
     */
    mecab_t* function(const(char)* arg) mecab_new2;

    /**
     * C wrapper of MeCab::Tagger::version()
     */
    const(char)* function() mecab_version;

    /**
     * C wrapper of MeCab::getLastError()
     */
    const(char)* function(mecab_t* mecab) mecab_strerror;

    /**
     * C wrapper of MeCab::deleteTagger(tagger)
     */
    void function(mecab_t* mecab) mecab_destroy;

    /**
     *C wrapper of MeCab::Tagger:set_partial()
     */
    int function(mecab_t* mecab) mecab_get_partial;

    /**
     * C wrapper of MeCab::Tagger::partial()
     */
    void function(mecab_t* mecab, int partial) mecab_set_partial;

    /**
     * C wrapper of MeCab::Tagger::theta()
     */
    float function(mecab_t* mecab) mecab_get_theta;

    /**
     * C wrapper of  MeCab::Tagger::set_theta()
     */
    void function(mecab_t* mecab, float theta) mecab_set_theta;

    /**
     * C wrapper of MeCab::Tagger::lattice_level()
     */
    int function(mecab_t* mecab) mecab_get_lattice_level;

    /**
     * C wrapper of MeCab::Tagger::set_lattice_level()
     */
    void function(mecab_t* mecab, int level) mecab_set_lattice_level;

    /**
     * C wrapper of MeCab::Tagger::all_morphs()
     */
    int function(mecab_t* mecab) mecab_get_all_morphs;

    /**
     * C wrapper of MeCab::Tagger::set_all_moprhs()
     */
    void function(mecab_t* mecab, int all_morphs) mecab_set_all_morphs;

    /**
     * C wrapper of MeCab::Tagger::parse(MeCab::Lattice *lattice)
     */
    int function(mecab_t* mecab, mecab_lattice_t* lattice) mecab_parse_lattice;

    /**
     * C wrapper of MeCab::Tagger::parse(char *str)
     */
    const(char)* function(mecab_t* mecab, char* str) mecab_sparse_tostr;

    /**
     * C wrapper of MeCab::Tagger::parse(char *str, size_t len)
     */
    const(char)* function(mecab_t* mecab, char* str, size_t len) mecab_sparse_tostr2;

    /**
     * C wrapper of MeCab::Tagger::parse(char *str, char *ostr, size_t olen)
     */
    char* function(mecab_t* mecab, const(char)* str, size_t len, char* ostr, size_t olen) mecab_sparse_tostr3;

    /**
     * C wrapper of MeCab::Tagger::parseToNode(char *str)
     */
    const(mecab_node_t)* function(mecab_t* mecab, const(char)*) mecab_sparse_tonode;

    /**
     * C wrapper of MeCab::Tagger::parseToNode(char *str, size_t len)
     */
    const(mecab_node_t)* function(mecab_t* mecab, const(char)*, size_t) mecab_sparse_tonode2;

    /**
     * C wrapper of MeCab::Tagger::parseNBest(size_t N, char *str)
     */
    const(char)* function(mecab_t* mecab, size_t N, const(char)* str) mecab_nbest_sparse_tostr;

    /**
     * C wrapper of MeCab::Tagger::parseNBest(size_t N, char *str, size_t len)
     */
    const(char)* function(mecab_t* mecab, size_t N, const(char)* str, size_t len) mecab_nbest_sparse_tostr2;

    /**
     * C wrapper of MeCab::Tagger::parseNBest(size_t N, char *str, char *ostr, size_t olen)
     */
    char* function(mecab_t* mecab, size_t N, const(char)* str, size_t len, char* ostr, size_t olen) mecab_nbest_sparse_tostr3;

    /**
     * C wrapper of MeCab::Tagger::parseNBestInit(char *str)
     */
    int function(mecab_t* mecab, const(char)* str) mecab_nbest_init;

    /**
     * C wrapper of MeCab::Tagger::parseNBestInit(char *str, size_t len)
     */
    int function(mecab_t* mecab, const(char)* str, size_t len) mecab_nbest_init2;

    /**
     * C wrapper of MeCab::Tagger::next()
     */
    const(char)* function(mecab_t* mecab) mecab_nbest_next_tostr;

    /**
     * C wrapper of MeCab::Tagger::next(char *ostr, size_t olen)
     */
    char* function(mecab_t* mecab, char* ostr, size_t olen) mecab_nbest_next_tostr2;

    /**
     * C wrapper of MeCab::Tagger::nextNode()
     */
    const(mecab_node_t)* function(mecab_t* mecab) mecab_nbest_next_tonode;

    /**
     * C wrapper of MeCab::Tagger::formatNode(const Node *node)
     */
    const(char)* function(mecab_t* mecab, const(mecab_node_t)* node) mecab_format_node;

    /**
     * C wrapper of MeCab::Tagger::dictionary_info()
     */
    const(mecab_dictionary_info_t)* function(mecab_t* mecab) mecab_dictionary_info;

    /* lattice interface */
    /**
     * C wrapper of MeCab::createLattice()
     */
    mecab_lattice_t* function() mecab_lattice_new;

    /**
     * C wrapper of MeCab::deleteLattice(lattice)
     */
    void function(mecab_lattice_t* lattice) mecab_lattice_destroy;

    /**
     * C wrapper of MeCab::Lattice::clear()
     */
    void function(mecab_lattice_t* lattice) mecab_lattice_clear;

    /**
     * C wrapper of MeCab::Lattice::is_available()
     */
    int function(mecab_lattice_t* lattice) mecab_lattice_is_available;

    /**
     * C wrapper of MeCab::Lattice::bos_node()
     */
    mecab_node_t* function(mecab_lattice_t* lattice) mecab_lattice_get_bos_node;

    /**
     * C wrapper of MeCab::Lattice::eos_node()
     */
    mecab_node_t* function(mecab_lattice_t* lattice) mecab_lattice_get_eos_node;

    /**
     * C wrapper of MeCab::Lattice::begin_nodes()
     */
    mecab_node_t** function(mecab_lattice_t* lattice) mecab_lattice_get_all_begin_nodes;

    /**
     * C wrapper of MeCab::Lattice::end_nodes()
     */
    mecab_node_t** function(mecab_lattice_t* lattice) mecab_lattice_get_all_end_nodes;

    /**
     * C wrapper of MeCab::Lattice::begin_nodes(pos)
     */
    mecab_node_t* function(mecab_lattice_t* lattice, size_t pos) mecab_lattice_get_begin_nodes;

    /**
     * C wrapper of MeCab::Lattice::end_nodes(pos)
     */
    mecab_node_t* function(mecab_lattice_t* lattice, size_t pos) mecab_lattice_get_end_nodes;

    /**
     * C wrapper of MeCab::Lattice::sentence()
     */
    char* function(mecab_lattice_t* lattice) mecab_lattice_get_sentence;

    /**
     * C wrapper of MeCab::Lattice::set_sentence(sentence)
     */
    void function(mecab_lattice_t* lattice, const(char)* sentence) mecab_lattice_set_sentence;

    /**
     * C wrapper of MeCab::Lattice::set_sentence(sentence, len)
     */
    void function(mecab_lattice_t* lattice, const(char)* sentence, size_t len) mecab_lattice_set_sentence2;

    /**
     * C wrapper of MeCab::Lattice::size()
     */
    size_t function(mecab_lattice_t* lattice) mecab_lattice_get_size;

    /**
     * C wrapper of MeCab::Lattice::Z()
     */
    double function(mecab_lattice_t* lattice) mecab_lattice_get_z;

    /**
     * C wrapper of MeCab::Lattice::set_Z()
     */
    void function(mecab_lattice_t* lattice, double Z) mecab_lattice_set_z;

    /**
     * C wrapper of MeCab::Lattice::theta()
     */
    double function(mecab_lattice_t* lattice) mecab_lattice_get_theta;

    /**
     * C wrapper of MeCab::Lattice::set_theta()
     */
    void function(mecab_lattice_t* lattice, double theta) mecab_lattice_set_theta;

    /**
     * C wrapper of MeCab::Lattice::next()
     */
    int function(mecab_lattice_t* lattice) mecab_lattice_next;

    /**
     * C wrapper of MeCab::Lattice::request_type()
     */
    int function(mecab_lattice_t* lattice) mecab_lattice_get_request_type;

    /**
     * C wrapper of MeCab::Lattice::has_request_type()
     */
    int function(mecab_lattice_t* lattice, int request_type) mecab_lattice_has_request_type;

    /**
     * C wrapper of MeCab::Lattice::set_request_type()
     */
    void function(mecab_lattice_t* lattice, int request_type) mecab_lattice_set_request_type;

    /**
     * C wrapper of MeCab::Lattice::add_request_type()
     */
    void function(mecab_lattice_t* lattice, int request_type) mecab_lattice_add_request_type;

    /**
     * C wrapper of MeCab::Lattice::remove_request_type()
     */
    void function(mecab_lattice_t* lattice, int request_type) mecab_lattice_remove_request_type;

    /**
     * C wrapper of MeCab::Lattice::newNode();
     */
    mecab_node_t* function(mecab_lattice_t* lattice) mecab_lattice_new_node;

    /**
     * C wrapper of MeCab::Lattice::toString()
     */
    const(char)* function(mecab_lattice_t* lattice) mecab_lattice_tostr;

    /**
     * C wrapper of MeCab::Lattice::toString(buf, size)
     */
    const(char)* function(mecab_lattice_t* lattice, char* buf, size_t size) mecab_lattice_tostr2;

    /**
     * C wrapper of MeCab::Lattice::enumNBestAsString(N)
     */
    const(char)* function(mecab_lattice_t* lattice, size_t N) mecab_lattice_nbest_tostr;

    /**
     * C wrapper of MeCab::Lattice::enumNBestAsString(N, buf, size)
     */
    const(char)* function(mecab_lattice_t* lattice, size_t N, char* buf, size_t size) mecab_lattice_nbest_tostr2;

    /**
     * C wrapper of MeCab::Lattice::has_constraint()
     */
    int function(mecab_lattice_t* lattice) mecab_lattice_has_constraint;

    /**
     * C wrapper of MeCab::Lattice::boundary_constraint(pos)
     */
    int function(mecab_lattice_t* lattice, size_t pos) mecab_lattice_get_boundary_constraint;

    /**
     * C wrapper of MeCab::Lattice::feature_constraint(pos)
     */
    const(char)* function(mecab_lattice_t* lattice, size_t pos) mecab_lattice_get_feature_constraint;

    /**
     * C wrapper of MeCab::Lattice::boundary_constraint(pos, type)
     */
    void function(mecab_lattice_t* lattice, size_t pos, int boundary_type) mecab_lattice_set_boundary_constraint;

    /**
     * C wrapper of MeCab::Lattice::set_feature_constraint(begin_pos, end_pos, feature)
     */
    void function(mecab_lattice_t* lattice, size_t begin_pos, size_t end_pos, const(char)* feature) mecab_lattice_set_feature_constraint;

    /**
     * C wrapper of MeCab::Lattice::what()
     */
    const(char)* function(mecab_lattice_t* lattice) mecab_lattice_strerror;

    /* model interface */
    /**
     * C wapper of MeCab::Model::create(argc, argv)
     */
    mecab_model_t* function(int argc, char** argv) mecab_model_new;

    /**
     * C wapper of MeCab::Model::create(arg)
     */
    mecab_model_t* function(const(char)* arg) mecab_model_new2;

    /**
     * C wapper of MeCab::deleteModel(model)
     */
    void function(mecab_model_t* model) mecab_model_destroy;

    /**
     * C wapper of MeCab::Model::createTagger()
     */
    mecab_t* function(mecab_model_t* model) mecab_model_new_tagger;

    /**
     * C wapper of MeCab::Model::createLattice()
     */
    mecab_lattice_t* function(mecab_model_t* model) mecab_model_new_lattice;

    /**
     * C wrapper of MeCab::Model::swap()
     */
    int function(mecab_model_t* model, mecab_model_t* new_model) mecab_model_swap;

    /**
     * C wapper of MeCab::Model::dictionary_info()
     */
    const(mecab_dictionary_info_t)* function(mecab_model_t* model) mecab_model_dictionary_info;

    /**
     * C wrapper of MeCab::Model::transition_cost()
     */
    int function(mecab_model_t* model, ushort rcAttr, ushort lcAttr) mecab_model_transition_cost;

    /**
     * C wrapper of MeCab::Model::lookup()
     */
    mecab_node_t* function(mecab_model_t* model, const(char)* begin, const(char)* end, mecab_lattice_t* lattice) mecab_model_lookup;

    /* static functions */
    int function(int argc, char** argv) mecab_do;
    int function(int argc, char** argv) mecab_dict_index;
    int function(int argc, char** argv) mecab_dict_gen;
    int function(int argc, char** argv) mecab_cost_train;
    int function(int argc, char** argv) mecab_system_eval;
    int function(int argc, char** argv) mecab_test_gen;
}

enum MeCabSupport
{
    noLibrary,
    badLibrary,
    mecab,
}

private __gshared SharedLib lib;

void unloadMeCab()
{
    if (lib != invalidHandle)
    {
        lib.unload();
    }
}

MeCabSupport loadMeCab()
{
    version (Windows)
    {
        const(char)[][1] libNames = ["libmecab.dll"];
    }
    else version (OSX)
    {
        const(char)[][1] libNames = ["libmecab.dylib"];
    }
    else version (Posix)
    {
        const(char)[][1] libNames = ["mecab.so"];
    }
    else
    {
        static assert(false);
    }

    lib = load(libNames[0].ptr);
    if (lib == invalidHandle)
    {
        return MeCabSupport.noLibrary;
    }

    void bind(alias symbol)()
    {
        lib.bindSymbol(cast(void**)&symbol, symbol.stringof);
    }

    const errCount = errorCount();
    bind!(mecab_new);
    bind!(mecab_new2);
    bind!(mecab_version);
    bind!(mecab_strerror);
    bind!(mecab_destroy);
    bind!(mecab_get_partial);
    bind!(mecab_set_partial);
    bind!(mecab_get_theta);
    bind!(mecab_set_theta);
    bind!(mecab_get_lattice_level);
    bind!(mecab_set_lattice_level);
    bind!(mecab_get_all_morphs);
    bind!(mecab_set_all_morphs);
    bind!(mecab_parse_lattice);
    bind!(mecab_sparse_tostr);
    bind!(mecab_sparse_tostr2);
    bind!(mecab_sparse_tostr3);
    bind!(mecab_sparse_tonode);
    bind!(mecab_sparse_tonode2);
    bind!(mecab_nbest_sparse_tostr);
    bind!(mecab_nbest_sparse_tostr2);
    bind!(mecab_nbest_sparse_tostr3);
    bind!(mecab_nbest_init);
    bind!(mecab_nbest_init2);
    bind!(mecab_nbest_next_tostr);
    bind!(mecab_nbest_next_tostr2);
    bind!(mecab_nbest_next_tonode);
    bind!(mecab_format_node);
    bind!(mecab_dictionary_info);
    bind!(mecab_lattice_new);
    bind!(mecab_lattice_destroy);
    bind!(mecab_lattice_clear);
    bind!(mecab_lattice_is_available);
    bind!(mecab_lattice_get_bos_node);
    bind!(mecab_lattice_get_eos_node);
    bind!(mecab_lattice_get_all_begin_nodes);
    bind!(mecab_lattice_get_all_end_nodes);
    bind!(mecab_lattice_get_begin_nodes);
    bind!(mecab_lattice_get_end_nodes);
    bind!(mecab_lattice_get_sentence);
    bind!(mecab_lattice_set_sentence);
    bind!(mecab_lattice_set_sentence2);
    bind!(mecab_lattice_get_size);
    bind!(mecab_lattice_get_z);
    bind!(mecab_lattice_set_z);
    bind!(mecab_lattice_get_theta);
    bind!(mecab_lattice_set_theta);
    bind!(mecab_lattice_next);
    bind!(mecab_lattice_get_request_type);
    bind!(mecab_lattice_has_request_type);
    bind!(mecab_lattice_set_request_type);
    bind!(mecab_lattice_add_request_type);
    bind!(mecab_lattice_remove_request_type);
    bind!(mecab_lattice_new_node);
    bind!(mecab_lattice_tostr);
    bind!(mecab_lattice_tostr2);
    bind!(mecab_lattice_nbest_tostr);
    bind!(mecab_lattice_nbest_tostr2);
    bind!(mecab_lattice_has_constraint);
    bind!(mecab_lattice_get_boundary_constraint);
    bind!(mecab_lattice_get_feature_constraint);
    bind!(mecab_lattice_set_boundary_constraint);
    bind!(mecab_lattice_set_feature_constraint);
    bind!(mecab_lattice_strerror);
    bind!(mecab_model_new);
    bind!(mecab_model_new2);
    bind!(mecab_model_destroy);
    bind!(mecab_model_new_tagger);
    bind!(mecab_model_new_lattice);
    bind!(mecab_model_swap);
    bind!(mecab_model_dictionary_info);
    bind!(mecab_model_transition_cost);
    bind!(mecab_model_lookup);

    /* static functions */
    bind!(mecab_do);
    bind!(mecab_dict_index);
    bind!(mecab_dict_gen);
    bind!(mecab_cost_train);
    bind!(mecab_system_eval);
    bind!(mecab_test_gen);

    if (errorCount() != errCount)
        return MeCabSupport.badLibrary;

    return MeCabSupport.mecab;
}
