
struct SemiringContainer{T} <: Abstract_GrB_Container
    typed::Dict{DataType,T}
    SemiringContainer{T}() where {T<: Abstract_GrB_Semiring} = new(Dict{DataType,T}())
end

function loadsemirings()
    builtins = ["GxB_MIN_FIRST", "GxB_MAX_FIRST", "GxB_PLUS_FIRST", "GxB_TIMES_FIRST", "GxB_ANY_FIRST", "GxB_MIN_SECOND", "GxB_MAX_SECOND", "GxB_PLUS_SECOND", "GxB_TIMES_SECOND", "GxB_ANY_SECOND", "GxB_MIN_PAIR", "GxB_MAX_PAIR", "GxB_PLUS_PAIR", "GxB_TIMES_PAIR", "GxB_ANY_PAIR", "GxB_MIN_MIN", "GxB_MAX_MIN", "GxB_PLUS_MIN", "GxB_TIMES_MIN", "GxB_ANY_MIN", "GxB_MIN_MAX", "GxB_MAX_MAX", "GxB_PLUS_MAX", "GxB_TIMES_MAX", "GxB_ANY_MAX", "GxB_MIN_PLUS", "GxB_MAX_PLUS", "GxB_PLUS_PLUS", "GxB_TIMES_PLUS", "GxB_ANY_PLUS", "GxB_MIN_MINUS", "GxB_MAX_MINUS", "GxB_PLUS_MINUS", "GxB_TIMES_MINUS", "GxB_ANY_MINUS", "GxB_MIN_TIMES", "GxB_MAX_TIMES", "GxB_PLUS_TIMES", "GxB_TIMES_TIMES", "GxB_ANY_TIMES", "GxB_MIN_DIV", "GxB_MAX_DIV", "GxB_PLUS_DIV", "GxB_TIMES_DIV", "GxB_ANY_DIV", "GxB_MIN_RDIV", "GxB_MAX_RDIV", "GxB_PLUS_RDIV", "GxB_TIMES_RDIV", "GxB_ANY_RDIV", "GxB_MIN_RMINUS", "GxB_MAX_RMINUS", "GxB_PLUS_RMINUS", "GxB_TIMES_RMINUS", "GxB_ANY_RMINUS", "GxB_MIN_ISEQ", "GxB_MAX_ISEQ", "GxB_PLUS_ISEQ", "GxB_TIMES_ISEQ", "GxB_ANY_ISEQ", "GxB_MIN_ISNE", "GxB_MAX_ISNE", "GxB_PLUS_ISNE", "GxB_TIMES_ISNE", "GxB_ANY_ISNE", "GxB_MIN_ISGT", "GxB_MAX_ISGT", "GxB_PLUS_ISGT", "GxB_TIMES_ISGT", "GxB_ANY_ISGT", "GxB_MIN_ISLT", "GxB_MAX_ISLT", "GxB_PLUS_ISLT", "GxB_TIMES_ISLT", "GxB_ANY_ISLT", "GxB_MIN_ISGE", "GxB_MAX_ISGE", "GxB_PLUS_ISGE", "GxB_TIMES_ISGE", "GxB_ANY_ISGE", "GxB_MIN_ISLE", "GxB_MAX_ISLE", "GxB_PLUS_ISLE", "GxB_TIMES_ISLE", "GxB_ANY_ISLE", "GxB_MIN_LOR", "GxB_MAX_LOR", "GxB_PLUS_LOR", "GxB_TIMES_LOR", "GxB_ANY_LOR", "GxB_MIN_LAND", "GxB_MAX_LAND", "GxB_PLUS_LAND", "GxB_TIMES_LAND", "GxB_ANY_LAND", "GxB_MIN_LXOR", "GxB_MAX_LXOR", "GxB_PLUS_LXOR", "GxB_TIMES_LXOR", "GxB_ANY_LXOR", "GxB_LOR_NE", "GxB_LOR_EQ", "GxB_LAND_EQ", "GxB_LXOR_EQ", "GxB_EQ_EQ", "GxB_ANY_EQ", "GxB_LAND_NE", "GxB_LXOR_NE", "GxB_EQ_NE", "GxB_ANY_NE", "GxB_LOR_GT", "GxB_LAND_GT", "GxB_LXOR_GT", "GxB_EQ_GT", "GxB_ANY_GT", "GxB_LOR_LT", "GxB_LAND_LT", "GxB_LXOR_LT", "GxB_EQ_LT", "GxB_ANY_LT", "GxB_LOR_GE", "GxB_LAND_GE", "GxB_LXOR_GE", "GxB_EQ_GE", "GxB_ANY_GE", "GxB_LOR_LE", "GxB_LAND_LE", "GxB_LXOR_LE", "GxB_EQ_LE", "GxB_ANY_LE", "GxB_LOR_FIRST", "GxB_LAND_FIRST", "GxB_LXOR_FIRST", "GxB_EQ_FIRST", "GxB_LOR_SECOND", "GxB_LAND_SECOND", "GxB_LXOR_SECOND", "GxB_EQ_SECOND", "GxB_LOR_PAIR", "GxB_LAND_PAIR", "GxB_LXOR_PAIR", "GxB_EQ_PAIR", "GxB_LOR_LOR", "GxB_LAND_LOR", "GxB_LXOR_LOR", "GxB_EQ_LOR", "GxB_LOR_LAND", "GxB_LAND_LAND", "GxB_LXOR_LAND", "GxB_EQ_LAND", "GxB_LOR_LXOR", "GxB_LAND_LXOR", "GxB_LXOR_LXOR", "GxB_EQ_LXOR", "GxB_BOR_BOR", "GxB_BOR_BAND", "GxB_BOR_BXOR", "GxB_BOR_BXNOR", "GxB_BAND_BOR", "GxB_BAND_BAND", "GxB_BAND_BXOR", "GxB_BAND_BXNOR", "GxB_BXOR_BOR", "GxB_BXOR_BAND", "GxB_BXOR_BXOR", "GxB_BXOR_BXNOR", "GxB_BXNOR_BOR", "GxB_BXNOR_BAND", "GxB_BXNOR_BXOR", "GxB_BXNOR_BXNOR", "GxB_MIN_FIRSTI", "GxB_MAX_FIRSTI", "GxB_ANY_FIRSTI", "GxB_PLUS_FIRSTI", "GxB_TIMES_FIRSTI", "GxB_MIN_FIRSTI1", "GxB_MAX_FIRSTI1", "GxB_ANY_FIRSTI1", "GxB_PLUS_FIRSTI1", "GxB_TIMES_FIRSTI1", "GxB_MIN_FIRSTJ", "GxB_MAX_FIRSTJ", "GxB_ANY_FIRSTJ", "GxB_PLUS_FIRSTJ", "GxB_TIMES_FIRSTJ", "GxB_MIN_FIRSTJ1", "GxB_MAX_FIRSTJ1", "GxB_ANY_FIRSTJ1", "GxB_PLUS_FIRSTJ1", "GxB_TIMES_FIRSTJ1", "GxB_MIN_SECONDI", "GxB_MAX_SECONDI", "GxB_ANY_SECONDI", "GxB_PLUS_SECONDI", "GxB_TIMES_SECONDI", "GxB_MIN_SECONDI1", "GxB_MAX_SECONDI1", "GxB_ANY_SECONDI1", "GxB_PLUS_SECONDI1", "GxB_TIMES_SECONDI1", "GxB_MIN_SECONDJ", "GxB_MAX_SECONDJ", "GxB_ANY_SECONDJ", "GxB_PLUS_SECONDJ", "GxB_TIMES_SECONDJ", "GxB_MIN_SECONDJ1", "GxB_MAX_SECONDJ1", "GxB_ANY_SECONDJ1", "GxB_PLUS_SECONDJ1", "GxB_TIMES_SECONDJ1", "GrB_PLUS_TIMES_SEMIRING", "GrB_PLUS_MIN_SEMIRING", "GrB_MIN_PLUS_SEMIRING", "GrB_MIN_TIMES_SEMIRING", "GrB_MIN_FIRST_SEMIRING", "GrB_MIN_SECOND_SEMIRING", "GrB_MIN_MAX_SEMIRING", "GrB_MAX_PLUS_SEMIRING", "GrB_MAX_TIMES_SEMIRING", "GrB_MAX_FIRST_SEMIRING", "GrB_MAX_SECOND_SEMIRING", "GrB_MAX_MIN_SEMIRING", "GrB_LOR_LAND_SEMIRING", "GrB_LAND_LOR_SEMIRING", "GrB_LXOR_LAND_SEMIRING", "GrB_LXNOR_LOR_SEMIRING"]

    booleans = ["GxB_LOR_FIRST", "GxB_LAND_FIRST", "GxB_LXOR_FIRST", "GxB_EQ_FIRST", "GxB_ANY_FIRST", "GxB_LOR_SECOND", "GxB_LAND_SECOND", "GxB_LXOR_SECOND", "GxB_EQ_SECOND", "GxB_ANY_SECOND", "GxB_LOR_PAIR", "GxB_LAND_PAIR", "GxB_LXOR_PAIR", "GxB_EQ_PAIR", "GxB_ANY_PAIR", "GxB_LOR_LOR", "GxB_LAND_LOR", "GxB_LXOR_LOR", "GxB_EQ_LOR", "GxB_ANY_LOR", "GxB_LOR_LAND", "GxB_LAND_LAND", "GxB_LXOR_LAND", "GxB_EQ_LAND", "GxB_ANY_LAND", "GxB_LOR_LXOR", "GxB_LAND_LXOR", "GxB_LXOR_LXOR", "GxB_EQ_LXOR", "GxB_ANY_LXOR", "GxB_LOR_EQ", "GxB_LAND_EQ", "GxB_LXOR_EQ", "GxB_EQ_EQ", "GxB_ANY_EQ", "GxB_LOR_GT", "GxB_LAND_GT", "GxB_LXOR_GT", "GxB_EQ_GT", "GxB_ANY_GT", "GxB_LOR_LT", "GxB_LAND_LT", "GxB_LXOR_LT", "GxB_EQ_LT", "GxB_ANY_LT", "GxB_LOR_GE", "GxB_LAND_GE", "GxB_LXOR_GE", "GxB_EQ_GE", "GxB_ANY_GE", "GxB_LOR_LE", "GxB_LAND_LE", "GxB_LXOR_LE", "GxB_EQ_LE", "GxB_ANY_LE", "GrB_LOR_LAND_SEMIRING", "GrB_LAND_LOR_SEMIRING", "GrB_LXOR_LAND_SEMIRING", "GrB_LXNOR_LOR_SEMIRING"]

    integers = ["GxB_MIN_FIRST", "GxB_MAX_FIRST", "GxB_PLUS_FIRST", "GxB_TIMES_FIRST", "GxB_ANY_FIRST", "GxB_MIN_SECOND", "GxB_MAX_SECOND", "GxB_PLUS_SECOND", "GxB_TIMES_SECOND", "GxB_ANY_SECOND", "GxB_MIN_PAIR", "GxB_MAX_PAIR", "GxB_PLUS_PAIR", "GxB_TIMES_PAIR", "GxB_ANY_PAIR", "GxB_MIN_MIN", "GxB_MAX_MIN", "GxB_PLUS_MIN", "GxB_TIMES_MIN", "GxB_ANY_MIN", "GxB_MIN_MAX", "GxB_MAX_MAX", "GxB_PLUS_MAX", "GxB_TIMES_MAX", "GxB_ANY_MAX", "GxB_MIN_PLUS", "GxB_MAX_PLUS", "GxB_PLUS_PLUS", "GxB_TIMES_PLUS", "GxB_ANY_PLUS", "GxB_MIN_MINUS", "GxB_MAX_MINUS", "GxB_PLUS_MINUS", "GxB_TIMES_MINUS", "GxB_ANY_MINUS", "GxB_MIN_TIMES", "GxB_MAX_TIMES", "GxB_PLUS_TIMES", "GxB_TIMES_TIMES", "GxB_ANY_TIMES", "GxB_MIN_DIV", "GxB_MAX_DIV", "GxB_PLUS_DIV", "GxB_TIMES_DIV", "GxB_ANY_DIV", "GxB_MIN_RDIV", "GxB_MAX_RDIV", "GxB_PLUS_RDIV", "GxB_TIMES_RDIV", "GxB_ANY_RDIV", "GxB_MIN_RMINUS", "GxB_MAX_RMINUS", "GxB_PLUS_RMINUS", "GxB_TIMES_RMINUS", "GxB_ANY_RMINUS", "GxB_MIN_ISEQ", "GxB_MAX_ISEQ", "GxB_PLUS_ISEQ", "GxB_TIMES_ISEQ", "GxB_ANY_ISEQ", "GxB_MIN_ISNE", "GxB_MAX_ISNE", "GxB_PLUS_ISNE", "GxB_TIMES_ISNE", "GxB_ANY_ISNE", "GxB_MIN_ISGT", "GxB_MAX_ISGT", "GxB_PLUS_ISGT", "GxB_TIMES_ISGT", "GxB_ANY_ISGT", "GxB_MIN_ISLT", "GxB_MAX_ISLT", "GxB_PLUS_ISLT", "GxB_TIMES_ISLT", "GxB_ANY_ISLT", "GxB_MIN_ISGE", "GxB_MAX_ISGE", "GxB_PLUS_ISGE", "GxB_TIMES_ISGE", "GxB_ANY_ISGE", "GxB_MIN_ISLE", "GxB_MAX_ISLE", "GxB_PLUS_ISLE", "GxB_TIMES_ISLE", "GxB_ANY_ISLE", "GxB_MIN_LOR", "GxB_MAX_LOR", "GxB_PLUS_LOR", "GxB_TIMES_LOR", "GxB_ANY_LOR", "GxB_MIN_LAND", "GxB_MAX_LAND", "GxB_PLUS_LAND", "GxB_TIMES_LAND", "GxB_ANY_LAND", "GxB_MIN_LXOR", "GxB_MAX_LXOR", "GxB_PLUS_LXOR", "GxB_TIMES_LXOR", "GxB_ANY_LXOR", "GxB_LOR_NE", "GxB_LOR_EQ", "GxB_LAND_EQ", "GxB_LXOR_EQ", "GxB_EQ_EQ", "GxB_ANY_EQ", "GxB_LAND_NE", "GxB_LXOR_NE", "GxB_EQ_NE", "GxB_ANY_NE", "GxB_LOR_GT", "GxB_LAND_GT", "GxB_LXOR_GT", "GxB_EQ_GT", "GxB_ANY_GT", "GxB_LOR_LT", "GxB_LAND_LT", "GxB_LXOR_LT", "GxB_EQ_LT", "GxB_ANY_LT", "GxB_LOR_GE", "GxB_LAND_GE", "GxB_LXOR_GE", "GxB_EQ_GE", "GxB_ANY_GE", "GxB_LOR_LE", "GxB_LAND_LE", "GxB_LXOR_LE", "GxB_EQ_LE", "GxB_ANY_LE", "GrB_PLUS_TIMES_SEMIRING", "GrB_PLUS_MIN_SEMIRING", "GrB_MIN_PLUS_SEMIRING", "GrB_MIN_TIMES_SEMIRING", "GrB_MIN_FIRST_SEMIRING", "GrB_MIN_SECOND_SEMIRING", "GrB_MIN_MAX_SEMIRING", "GrB_MAX_PLUS_SEMIRING", "GrB_MAX_TIMES_SEMIRING", "GrB_MAX_FIRST_SEMIRING", "GrB_MAX_SECOND_SEMIRING", "GrB_MAX_MIN_SEMIRING"]

    unsignedintegers = ["GxB_MIN_FIRST", "GxB_MAX_FIRST", "GxB_PLUS_FIRST", "GxB_TIMES_FIRST", "GxB_ANY_FIRST", "GxB_MIN_SECOND", "GxB_MAX_SECOND", "GxB_PLUS_SECOND", "GxB_TIMES_SECOND", "GxB_ANY_SECOND", "GxB_MIN_PAIR", "GxB_MAX_PAIR", "GxB_PLUS_PAIR", "GxB_TIMES_PAIR", "GxB_ANY_PAIR", "GxB_MIN_MIN", "GxB_MAX_MIN", "GxB_PLUS_MIN", "GxB_TIMES_MIN", "GxB_ANY_MIN", "GxB_MIN_MAX", "GxB_MAX_MAX", "GxB_PLUS_MAX", "GxB_TIMES_MAX", "GxB_ANY_MAX", "GxB_MIN_PLUS", "GxB_MAX_PLUS", "GxB_PLUS_PLUS", "GxB_TIMES_PLUS", "GxB_ANY_PLUS", "GxB_MIN_MINUS", "GxB_MAX_MINUS", "GxB_PLUS_MINUS", "GxB_TIMES_MINUS", "GxB_ANY_MINUS", "GxB_MIN_TIMES", "GxB_MAX_TIMES", "GxB_PLUS_TIMES", "GxB_TIMES_TIMES", "GxB_ANY_TIMES", "GxB_MIN_DIV", "GxB_MAX_DIV", "GxB_PLUS_DIV", "GxB_TIMES_DIV", "GxB_ANY_DIV", "GxB_MIN_RDIV", "GxB_MAX_RDIV", "GxB_PLUS_RDIV", "GxB_TIMES_RDIV", "GxB_ANY_RDIV", "GxB_MIN_RMINUS", "GxB_MAX_RMINUS", "GxB_PLUS_RMINUS", "GxB_TIMES_RMINUS", "GxB_ANY_RMINUS", "GxB_MIN_ISEQ", "GxB_MAX_ISEQ", "GxB_PLUS_ISEQ", "GxB_TIMES_ISEQ", "GxB_ANY_ISEQ", "GxB_MIN_ISNE", "GxB_MAX_ISNE", "GxB_PLUS_ISNE", "GxB_TIMES_ISNE", "GxB_ANY_ISNE", "GxB_MIN_ISGT", "GxB_MAX_ISGT", "GxB_PLUS_ISGT", "GxB_TIMES_ISGT", "GxB_ANY_ISGT", "GxB_MIN_ISLT", "GxB_MAX_ISLT", "GxB_PLUS_ISLT", "GxB_TIMES_ISLT", "GxB_ANY_ISLT", "GxB_MIN_ISGE", "GxB_MAX_ISGE", "GxB_PLUS_ISGE", "GxB_TIMES_ISGE", "GxB_ANY_ISGE", "GxB_MIN_ISLE", "GxB_MAX_ISLE", "GxB_PLUS_ISLE", "GxB_TIMES_ISLE", "GxB_ANY_ISLE", "GxB_MIN_LOR", "GxB_MAX_LOR", "GxB_PLUS_LOR", "GxB_TIMES_LOR", "GxB_ANY_LOR", "GxB_MIN_LAND", "GxB_MAX_LAND", "GxB_PLUS_LAND", "GxB_TIMES_LAND", "GxB_ANY_LAND", "GxB_MIN_LXOR", "GxB_MAX_LXOR", "GxB_PLUS_LXOR", "GxB_TIMES_LXOR", "GxB_ANY_LXOR", "GxB_LOR_NE", "GxB_LOR_EQ", "GxB_LAND_EQ", "GxB_LXOR_EQ", "GxB_EQ_EQ", "GxB_ANY_EQ", "GxB_LAND_NE", "GxB_LXOR_NE", "GxB_EQ_NE", "GxB_ANY_NE", "GxB_LOR_GT", "GxB_LAND_GT", "GxB_LXOR_GT", "GxB_EQ_GT", "GxB_ANY_GT", "GxB_LOR_LT", "GxB_LAND_LT", "GxB_LXOR_LT", "GxB_EQ_LT", "GxB_ANY_LT", "GxB_LOR_GE", "GxB_LAND_GE", "GxB_LXOR_GE", "GxB_EQ_GE", "GxB_ANY_GE", "GxB_LOR_LE", "GxB_LAND_LE", "GxB_LXOR_LE", "GxB_EQ_LE", "GxB_ANY_LE", "GxB_BOR_BOR", "GxB_BOR_BAND", "GxB_BOR_BXOR", "GxB_BOR_BXNOR", "GxB_BAND_BOR", "GxB_BAND_BAND", "GxB_BAND_BXOR", "GxB_BAND_BXNOR", "GxB_BXOR_BOR", "GxB_BXOR_BAND", "GxB_BXOR_BXOR", "GxB_BXOR_BXNOR", "GxB_BXNOR_BOR", "GxB_BXNOR_BAND", "GxB_BXNOR_BXOR", "GxB_BXNOR_BXNOR", "GrB_PLUS_TIMES_SEMIRING", "GrB_PLUS_MIN_SEMIRING", "GrB_MIN_PLUS_SEMIRING", "GrB_MIN_TIMES_SEMIRING", "GrB_MIN_FIRST_SEMIRING", "GrB_MIN_SECOND_SEMIRING", "GrB_MIN_MAX_SEMIRING", "GrB_MAX_PLUS_SEMIRING", "GrB_MAX_TIMES_SEMIRING", "GrB_MAX_FIRST_SEMIRING", "GrB_MAX_SECOND_SEMIRING", "GrB_MAX_MIN_SEMIRING"]

    floats = ["GxB_MIN_FIRST", "GxB_MAX_FIRST", "GxB_PLUS_FIRST", "GxB_TIMES_FIRST", "GxB_ANY_FIRST", "GxB_MIN_SECOND", "GxB_MAX_SECOND", "GxB_PLUS_SECOND", "GxB_TIMES_SECOND", "GxB_ANY_SECOND", "GxB_MIN_PAIR", "GxB_MAX_PAIR", "GxB_PLUS_PAIR", "GxB_TIMES_PAIR", "GxB_ANY_PAIR", "GxB_MIN_MIN", "GxB_MAX_MIN", "GxB_PLUS_MIN", "GxB_TIMES_MIN", "GxB_ANY_MIN", "GxB_MIN_MAX", "GxB_MAX_MAX", "GxB_PLUS_MAX", "GxB_TIMES_MAX", "GxB_ANY_MAX", "GxB_MIN_PLUS", "GxB_MAX_PLUS", "GxB_PLUS_PLUS", "GxB_TIMES_PLUS", "GxB_ANY_PLUS", "GxB_MIN_MINUS", "GxB_MAX_MINUS", "GxB_PLUS_MINUS", "GxB_TIMES_MINUS", "GxB_ANY_MINUS", "GxB_MIN_TIMES", "GxB_MAX_TIMES", "GxB_PLUS_TIMES", "GxB_TIMES_TIMES", "GxB_ANY_TIMES", "GxB_MIN_DIV", "GxB_MAX_DIV", "GxB_PLUS_DIV", "GxB_TIMES_DIV", "GxB_ANY_DIV", "GxB_MIN_RDIV", "GxB_MAX_RDIV", "GxB_PLUS_RDIV", "GxB_TIMES_RDIV", "GxB_ANY_RDIV", "GxB_MIN_RMINUS", "GxB_MAX_RMINUS", "GxB_PLUS_RMINUS", "GxB_TIMES_RMINUS", "GxB_ANY_RMINUS", "GxB_MIN_ISEQ", "GxB_MAX_ISEQ", "GxB_PLUS_ISEQ", "GxB_TIMES_ISEQ", "GxB_ANY_ISEQ", "GxB_MIN_ISNE", "GxB_MAX_ISNE", "GxB_PLUS_ISNE", "GxB_TIMES_ISNE", "GxB_ANY_ISNE", "GxB_MIN_ISGT", "GxB_MAX_ISGT", "GxB_PLUS_ISGT", "GxB_TIMES_ISGT", "GxB_ANY_ISGT", "GxB_MIN_ISLT", "GxB_MAX_ISLT", "GxB_PLUS_ISLT", "GxB_TIMES_ISLT", "GxB_ANY_ISLT", "GxB_MIN_ISGE", "GxB_MAX_ISGE", "GxB_PLUS_ISGE", "GxB_TIMES_ISGE", "GxB_ANY_ISGE", "GxB_MIN_ISLE", "GxB_MAX_ISLE", "GxB_PLUS_ISLE", "GxB_TIMES_ISLE", "GxB_ANY_ISLE", "GxB_MIN_LOR", "GxB_MAX_LOR", "GxB_PLUS_LOR", "GxB_TIMES_LOR", "GxB_ANY_LOR", "GxB_MIN_LAND", "GxB_MAX_LAND", "GxB_PLUS_LAND", "GxB_TIMES_LAND", "GxB_ANY_LAND", "GxB_MIN_LXOR", "GxB_MAX_LXOR", "GxB_PLUS_LXOR", "GxB_TIMES_LXOR", "GxB_ANY_LXOR", "GxB_LOR_NE", "GxB_LOR_EQ", "GxB_LAND_EQ", "GxB_LXOR_EQ", "GxB_EQ_EQ", "GxB_ANY_EQ", "GxB_LAND_NE", "GxB_LXOR_NE", "GxB_EQ_NE", "GxB_ANY_NE", "GxB_LOR_GT", "GxB_LAND_GT", "GxB_LXOR_GT", "GxB_EQ_GT", "GxB_ANY_GT", "GxB_LOR_LT", "GxB_LAND_LT", "GxB_LXOR_LT", "GxB_EQ_LT", "GxB_ANY_LT", "GxB_LOR_GE", "GxB_LAND_GE", "GxB_LXOR_GE", "GxB_EQ_GE", "GxB_ANY_GE", "GxB_LOR_LE", "GxB_LAND_LE", "GxB_LXOR_LE", "GxB_EQ_LE", "GxB_ANY_LE", "GrB_PLUS_TIMES_SEMIRING", "GrB_PLUS_MIN_SEMIRING", "GrB_MIN_PLUS_SEMIRING", "GrB_MIN_TIMES_SEMIRING", "GrB_MIN_FIRST_SEMIRING", "GrB_MIN_SECOND_SEMIRING", "GrB_MIN_MAX_SEMIRING", "GrB_MAX_PLUS_SEMIRING", "GrB_MAX_TIMES_SEMIRING", "GrB_MAX_FIRST_SEMIRING", "GrB_MAX_SECOND_SEMIRING", "GrB_MAX_MIN_SEMIRING"]

    positionals = ["GxB_MIN_FIRSTI", "GxB_MAX_FIRSTI", "GxB_ANY_FIRSTI", "GxB_PLUS_FIRSTI", "GxB_TIMES_FIRSTI", "GxB_MIN_FIRSTI1", "GxB_MAX_FIRSTI1", "GxB_ANY_FIRSTI1", "GxB_PLUS_FIRSTI1", "GxB_TIMES_FIRSTI1", "GxB_MIN_FIRSTJ", "GxB_MAX_FIRSTJ", "GxB_ANY_FIRSTJ", "GxB_PLUS_FIRSTJ", "GxB_TIMES_FIRSTJ", "GxB_MIN_FIRSTJ1", "GxB_MAX_FIRSTJ1", "GxB_ANY_FIRSTJ1", "GxB_PLUS_FIRSTJ1", "GxB_TIMES_FIRSTJ1", "GxB_MIN_SECONDI", "GxB_MAX_SECONDI", "GxB_ANY_SECONDI", "GxB_PLUS_SECONDI", "GxB_TIMES_SECONDI", "GxB_MIN_SECONDI1", "GxB_MAX_SECONDI1", "GxB_ANY_SECONDI1", "GxB_PLUS_SECONDI1", "GxB_TIMES_SECONDI1", "GxB_MIN_SECONDJ", "GxB_MAX_SECONDJ", "GxB_ANY_SECONDJ", "GxB_PLUS_SECONDJ", "GxB_TIMES_SECONDJ", "GxB_MIN_SECONDJ1", "GxB_MAX_SECONDJ1", "GxB_ANY_SECONDJ1", "GxB_PLUS_SECONDJ1", "GxB_TIMES_SECONDJ1"]

    for name ∈ builtins
        simple = string(name[5:end])
        opname = Symbol("_" * simple)
        exportedname = Symbol(simple)
        structquote = quote
            struct $opname{T} <: Abstract_GrB_Semiring
                p::Ptr{Cvoid}
                $opname{T}() where {T} = new(C_NULL)
                $opname{T}(p::Ptr{Cvoid}) where {T} = new(p)
            end
            const $exportedname = $SemiringContainer{$opname}()
            export $exportedname
        end
        @eval($structquote)
    end
    for name ∈ booleans
        simple = string(name[5:end])
        opname = Symbol("_" * simple)
        exportedname = Symbol(simple)
        constname = name * "_BOOL"
        boolquote = quote
            $exportedname.typed[Bool] = $opname{Bool}(load_global($constname))
        end
        @eval($boolquote)
    end

    for name ∈ integers
        simple = string(name[5:end])
        opname = Symbol("_" * simple)
        exportedname = Symbol(simple)
        integerquote = quote 
            $exportedname.typed[Int8] = $opname{Int8}(load_global($(name * "_INT8")))
            $exportedname.typed[Int16] = $opname{Int16}(load_global($(name * "_INT16")))
            $exportedname.typed[Int32] = $opname{Int32}(load_global($(name * "_INT32")))
            $exportedname.typed[Int64] = $opname{Int64}(load_global($(name * "_INT64")))
        end
        @eval($integerquote)
    end

    for name ∈ unsignedintegers
        simple = string(name[5:end])
        opname = Symbol("_" * simple)
        exportedname = Symbol(simple)
        unsignedintegerquote = quote 
            $exportedname.typed[UInt8] = $opname{UInt8}(load_global($(name * "_UINT8")))
            $exportedname.typed[UInt16] = $opname{UInt16}(load_global($(name * "_UINT16")))
            $exportedname.typed[UInt32] = $opname{UInt32}(load_global($(name * "_UINT32")))
            $exportedname.typed[UInt64] = $opname{UInt64}(load_global($(name * "_UINT64")))
        end
        @eval($unsignedintegerquote)
    end

    for name ∈ floats
        simple = string(name[5:end])
        opname = Symbol("_" * simple)
        exportedname = Symbol(simple)
        floatquote = quote 
            $exportedname.typed[Float32] = $opname{Float32}(load_global($(name * "_FP32")))
            $exportedname.typed[Float64] = $opname{Float64}(load_global($(name * "_FP64")))
        end
        @eval($floatquote)
    end
end
