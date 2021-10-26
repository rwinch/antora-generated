OUT_DIR=$(realpath `dirname $(dirname "$BASH_SOURCE")`)/build/generated

rm -rf $OUT_DIR
mkdir -p $OUT_DIR

# Generate antora.yml which contains a dynamic version and asciidoc attributes
echo "title: Component with name not in URL
name: generated
version: '2.0'
start_page: ROOT:index.adoc
asciidoc:
  attributes:
    spring_boot_version: 2.3.0.RELEASE
    hibernate_version: 5
" > "$OUT_DIR/antora.yml"

GENERATED_FILE_PATH="$OUT_DIR/modules/ROOT/pages/generated.adoc"

mkdir -p $(dirname "$GENERATED_FILE_PATH")
echo "= Generated

This is generated
" > "$GENERATED_FILE_PATH"