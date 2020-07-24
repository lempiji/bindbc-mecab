module bindbc.mecab.types;

/*
  MeCab -- Yet Another Part-of-Speech and Morphological Analyzer

  Copyright(C) 2001-2011 Taku Kudo <taku@chasen.org>
  Copyright(C) 2004-2006 Nippon Telegraph and Telephone Corporation
*/

/* C common data structures  */

@nogc nothrow:


extern (C)
{
    extern struct mecab_t;
    extern struct mecab_lattice_t;
    extern struct mecab_model_t;

    /**
     * DictionaryInfo structure
     */
    struct mecab_dictionary_info_t
    {
        /**
         * filename of dictionary
         * On Windows, filename is stored in UTF-8 encoding
         */
        const(char)* filename;

        /**
         * character set of the dictionary. e.g., "SHIFT-JIS", "UTF-8"
         */
        const(char)* charset;

        /**
         * How many words are registered in this dictionary.
         */
        uint size;

        /**
         * dictionary type
         * this value should be MECAB_USR_DIC, MECAB_SYS_DIC, or MECAB_UNK_DIC.
         */
        int type;

        /**
         * left attributes size
         */
        uint lsize;

        /**
         * right attributes size
         */
        uint rsize;

        /**
         * version of this dictionary
         */
        ushort version_;

        /**
         * pointer to the next dictionary info.
         */
        mecab_dictionary_info_t* next;
    }

    /**
     * Path structure
     */
    struct mecab_path_t
    {
        /**
         * pointer to the right node
         */
        mecab_node_t* rnode;

        /**
         * pointer to the next right path
         */
        mecab_path_t* rnext;

        /**
         * pointer to the left node
         */
        mecab_node_t* lnode;

        /**
         * pointer to the next left path
         */
        mecab_path_t* lnext;

        /**
         * local cost
         */
        int cost;

        /**
         * marginal probability
         */
        float prob;
    }

    /**
     * Node structure
     */
    struct mecab_node_t
    {
        /**
         * pointer to the previous node.
         */
        mecab_node_t* prev;

        /**
         * pointer to the next node.
         */
        mecab_node_t* next;

        /**
         * pointer to the node which ends at the same position.
         */
        mecab_node_t* enext;

        /**
         * pointer to the node which starts at the same position.
         */
        mecab_node_t* bnext;

        /**
         * pointer to the right path.
         * this value is NULL if MECAB_ONE_BEST mode.
         */
        mecab_path_t* rpath;

        /**
         * pointer to the right path.
         * this value is NULL if MECAB_ONE_BEST mode.
         */
        mecab_path_t* lpath;

        /**
         * surface string.
         * this value is not 0 terminated.
         * You can get the length with length/rlength members.
         */
        const(char)* surface;

        /**
         * feature string
         */
        const(char)* feature;

        /**
         * unique node id
         */
        uint id;

        /**
         * length of the surface form.
         */
        ushort length;

        /**
         * length of the surface form including white space before the morph.
         */
        ushort rlength;

        /**
         * right attribute id
         */
        ushort rcAttr;

        /**
         * left attribute id
         */
        ushort lcAttr;

        /**
         * unique part of speech id. This value is defined in "pos.def" file.
         */
        ushort posid;

        /**
         * character type
         */
        ubyte char_type;

        /**
         * status of this model.
         * This value is MECAB_NOR_NODE, MECAB_UNK_NODE, MECAB_BOS_NODE, MECAB_EOS_NODE, or MECAB_EON_NODE.
         */
        ubyte stat;

        /**
         * set 1 if this node is best node.
         */
        ubyte isbest;

        /**
         * forward accumulative log summation.
         * This value is only available when MECAB_MARGINAL_PROB is passed.
         */
        float alpha;

        /**
         * backward accumulative log summation.
         * This value is only available when MECAB_MARGINAL_PROB is passed.
         */
        float beta;

        /**
         * marginal probability.
         * This value is only available when MECAB_MARGINAL_PROB is passed.
         */
        float prob;

        /**
         * word cost.
         */
        short wcost;

        /**
         * best accumulative cost from bos node to this node.
         */
        long cost;
    }

    /**
     * Parameters for MeCab::Node::stat
     */
    enum
    {
        /**
         * Normal node defined in the dictionary.
         */
        MECAB_NOR_NODE,
        /**
         * Unknown node not defined in the dictionary.
         */
        MECAB_UNK_NODE = 1,
        /**
         * Virtual node representing a beginning of the sentence.
         */
        MECAB_BOS_NODE = 2,
        /**
         * Virtual node representing a end of the sentence.
         */
        MECAB_EOS_NODE = 3,

        /**
         * Virtual node representing a end of the N-best enumeration.
         */
        MECAB_EON_NODE = 4
    };

    /**
     * Parameters for MeCab::DictionaryInfo::type
     */
    enum
    {
        /**
         * This is a system dictionary.
         */
        MECAB_SYS_DIC,

        /**
         * This is a user dictionary.
         */
        MECAB_USR_DIC = 1,

        /**
         * This is a unknown word dictionary.
         */
        MECAB_UNK_DIC = 2
    };

    /**
     * Parameters for MeCab::Lattice::request_type
     */
    enum
    {
        /**
         * One best result is obtained (default mode)
         */
        MECAB_ONE_BEST = 1,
        /**
         * Set this flag if you want to obtain N best results.
         */
        MECAB_NBEST = 2,
        /**
         * Set this flag if you want to enable a partial parsing mode.
         * When this flag is set, the input |sentence| needs to be written
         * in partial parsing format.
         */
        MECAB_PARTIAL = 4,
        /**
         * Set this flag if you want to obtain marginal probabilities.
         * Marginal probability is set in MeCab::Node::prob.
         * The parsing speed will get 3-5 times slower than the default mode.
         */
        MECAB_MARGINAL_PROB = 8,
        /**
         * Set this flag if you want to obtain alternative results.
         * Not implemented.
         */
        MECAB_ALTERNATIVE = 16,
        /**
         * When this flag is set, the result linked-list (Node::next/prev)
         * traverses all nodes in the lattice.
         */
        MECAB_ALL_MORPHS = 32,

        /**
         * When this flag is set, tagger internally copies the body of passed
         * sentence into internal buffer.
         */
        MECAB_ALLOCATE_SENTENCE = 64
    }

    /**
     * Parameters for MeCab::Lattice::boundary_constraint_type
     */
    enum
    {
        /**
         * The token boundary is not specified.
         */
        MECAB_ANY_BOUNDARY,

        /**
         * The position is a strong token boundary.
         */
        MECAB_TOKEN_BOUNDARY = 1,

        /**
         * The position is not a token boundary.
         */
        MECAB_INSIDE_TOKEN = 2
    }
}
