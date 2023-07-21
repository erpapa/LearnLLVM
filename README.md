### 1.创建build目录
```
mkdir build
cd build
```

### 2.生成可执行文件

```
cmake ../ -DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_C_FLAGS_DEBUG="-g -Wall" \
-DCMAKE_CXX_FLAGS_DEBUG="-g -Wall" \
-DCMAKE_C_COMPILER=clang \
-DCMAKE_CXX_COMPILER=clang++ \
-DCMAKE_C_STANDARD=11 \
-DCMAKE_CXX_STANDARD=17 \
-DCMAKE_CXX_EXTENSIONS=OFF \
make -j8
```

### 3.生成Xcode工程

```
cmake -G Xcode ../ -DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_C_FLAGS_DEBUG="-g -Wall" \
-DCMAKE_CXX_FLAGS_DEBUG="-g -Wall" \
-DCMAKE_C_COMPILER=clang \
-DCMAKE_CXX_COMPILER=clang++ \
-DCMAKE_C_STANDARD=11 \
-DCMAKE_CXX_STANDARD=17 \
-DCMAKE_CXX_EXTENSIONS=OFF \
-DCMAKE_XCODE_ATTRIBUTE_GCC_C_LANGUAGE_STANDARD=c11 \
-DCMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD=c++17 \
-DCMAKE_XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT="dwarf-with-dsym"
```
