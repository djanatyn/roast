use v6;
use Test;

# this file should become the test for systematically testing
# Match objects. Exception: .caps and .chunks are tested in caps.t

plan 21;

ok 'ab12de' ~~ /\d+/,           'match successful';
is $/.WHAT.gist, Match.gist,    'got right type';
ok $/.Bool,                     '.Bool';
ok $/.defined,                  '.defined';
is $/.Str,         '12',        '.Str';
is $/.from,           2,        '.from';
is $/.to,             4,        '.to';
is $/.prematch,    'ab',        '.prematch';
is $/.postmatch,   'de',        '.postmatch';
is $/.list.elems,     0,        '.list (empty)';
is $/.hash.elems,     0,        '.hash (empty)';
is $/.keys.elems,     0,        '.keys (empty)';
is $/.values.elems,   0,        '.values (empty)';
is $/.pairs.elems,    0,        '.pairs (empty)';
is $/.kv.elems,       0,        '.kv (empty)';

nok 'abde' ~~ /\d/,             'no match';
nok $/.Bool,                    'failed match is False';
is  $/.Str,          '',        'false match stringifies to empty string';

#?rakudo 3 eval 'Non-declarative sigil is missing its name at line 1, near "$\x{a2} }/\n"'
my $c;
ok 'abc' ~~ /.{ $c = $¢ }/,     'current match state';
is $c.WHAT.gist, Cursor.gist,   'got right type';
ok defined($c.pos),             '.pos';
