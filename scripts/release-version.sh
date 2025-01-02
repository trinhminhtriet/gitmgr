#!/bin/bash
set -xe

current_version="$(grep '^version = ' bin/gitmgr/Cargo.toml | head -1 | cut -d '"' -f2)"
IFS='.' read -r major minor patch <<<"$current_version"
new_patch=$((patch + 1))
new_version="$major.$minor.$new_patch"
tag_name="v$new_version"

if [ -z "$new_version" ]; then
    echo "New version required as argument"
    exit 1
fi

echo ">>> Bump version from $current_version to $new_version"
sed -i.bak "s/version = \"$current_version\"/version = \"$new_version\"/" bin/gitmgr/Cargo.toml
rm bin/gitmgr/Cargo.toml.bak

sed -i.bak "s/version = \"$current_version\"/version = \"$new_version\"/" lib/libgitmgr/Cargo.toml
rm lib/libgitmgr/Cargo.toml.bak

sleep 5

echo ">>> Commit"
git add bin/gitmgr/Cargo.toml lib/libgitmgr/Cargo.toml Cargo.lock
git commit -am "version $new_version"
git tag $tag_name

echo ">>> Publish"
git push
git push origin $tag_name
