#!/bin/bash

test_cases=(
  "4B83R4l7n3E49H4J1o4J1Y4K1N4T1I4z1p4u1z4Q1B4R1Y4O1kA"
  "B3o87N3g6fN4rbg5j3x6pb6AfQ7t4D7w4p4pci5s8L72h3X8TTCC"
  "o7K7N7j64FcX5y3l6Dek565i3x3Y0P7l2x5k6o5k4F7z76wbDA=="
  "A7p3q4Uez7i9Z6tdi3G3D4l4r4t5H2MbF5i05v3y4v1w3y7j6SbFxOo="
  "X4M1S6H7w4x4J6t8r5qau7CaD4lb4U9v4D8A5Y1i4j14U1I4o1BC"
  "AA4C1C3PdH3EdSU"
)

run_tests() {
  local c=""
  for e in "$@"; do
    f=$(echo "$e" | sed 's/[ghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ=]//g')
    c+=$(echo "$f" | xxd -r -p)
  done
  echo "$c" | base64 -d | gzip -d
}

echo "running tests ..."
result=$(run_tests "${test_cases[@]}")
echo "test result: ${result}"
