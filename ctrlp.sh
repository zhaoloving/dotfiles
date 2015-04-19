#!/bin/bash
root=`pwd | sed 's/\(\/google\/src\/cloud\/zzb\/.*\/google3\).*/\1/g'`
root=`pwd | sed 's/\(\/google\/src\/cloud\/zzb\/[^\/]*\).*/\1/g'`
root="${root}/google3"
search_dirs=(\
  base \
  experimental/users/zzb\
  indexing/annotations \
  indexing/moonshine/export/proto \
  indexing/moonshine/tools/crawzall \
  pyglib \
  util/gtl \
  indexing/moonshine/goldmine/annotator \
  indexing/moonshine/goldmine/common \
  indexing/moonshine/goldmine/config \
  indexing/moonshine/goldmine/parser \
  indexing/moonshine/goldmine/proto \
  indexing/moonshine/goldmine/testutil \
  indexing/moonshine/goldmine/util \

  )
  # indexing/moonshine/goldmine \
ignore_dirs=(\
  indexing/moonshine/goldmine/testdata \
  )
# For those under ignore dir but no to ignore.
noignore_dirs=(\
  indexing/moonshine/goldmine/testdata \
  indexing/moonshine/goldmine/testdata2 \
  testdata \
  )

search_list=''
for dir in ${search_dirs[@]}; do
  search_list="$search_list ${root}/$dir"
done

ignore_list=''
for dir in ${ignore_dirs[@]}; do
  # if [[ $ignore_list != '' ]];then ignore_list="$ignore_list|"; fi;
  ignore_list="$ignore_list ! -path '${root}/$dir*'"
done

noignore_list=''
for dir in ${noignore_dirs[@]}; do
  noignore_list="$noignore_list ${root}/$dir"
done


find $search_list -type f -not -name ".*" $ignore_list
# Find again for noignore list
# find $noignore_list -type f -not -name ".*"



# find $search_list -type f -not -name ".*"
# find $search_list -type d
# find $search_list -type d -links 2 | egrep -v $ignore_list | xargs -i find {} -type f
