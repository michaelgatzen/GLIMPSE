# GLIMPSE2 Extension: Extract number of sites from reference chunk

This branch adds a binary to extract the number of rare and common sites in a given reference chunk to the GLIMPSE repo. This is required for the `GetNumberOfSitesInChunk` task in the [Glimpse2Imputation WDL](https://github.com/broadinstitute/palantir-workflows/tree/main/GlimpseImputationPipeline).

The required docker image for that task can be directly built with the `Dockerfile` in this repo.

The reference chunks can only be read using the version of [boost](https://www.boost.org/) that they have been created with. Therefore, if the upstream GLIMPSE repo changes the version of boost that it uses, this branch will have to be updated too. This can be done either by merging the new updates into this branch, or basing this branch on the new code and cherry-picking the commit that adds this library: `0692ae5c3c5d9d0107e9ef4e4d1b7f80cbc85190`. Possibly, some files in the `extract_num_sites_from_reference_chunk` subdirectory will have to be updated along with the other files of the GLIMPSE update. The entirety of the relevant code for extracting the number of sites is contained in `extract_num_sites_from_reference_chunk/src/main.cpp`.

## Usage
```
GLIMPSE2_extract_sites_from_chunk {path to reference.bin}
```

### Output
```
Lrare={number of rare sites}
Lcommon={number of common sites}
```