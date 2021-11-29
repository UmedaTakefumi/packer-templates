# Building Vagrant base boxes

| index | Flavor | Builders | buildbox | import box | mkdir directory | vagrant init | problem |
| ----- | ------ | -------- | -------- | -----------| --------------- | -------------| ------- |
| [1](centos-6.2-x86_64/build.txt) | [centos-6.2-x86_64](centos-6.2-x86_64) | virtualbox-iso | ✅  [OK] | ✅ [OK]| ✅ [OK] | ✅ [OK]| |
| [2](centos-6.3-x86_64/build.txt) | [centos-6.3-x86_64](centos-6.3-x86_64) | virtualbox-iso | ✅  [OK]| ✅ [OK]| 💩 [NotOK] | ✅ [OK] | [❗ [detail] ](centos-6.3-x86_64/problem.md) |
| [3](alpine-standard-3.14.2-x86_64/build.txt) | [alpine-standard-3.14.2-x86_64](alpine-standard-3.14.2-x86_64) | virtualbox-iso | ✅ [OK]| ✅ [OK] | ✅  [OK] | ✅  [OK]| |
| [4](ubuntu-14.04.5-x86_64/build.txt) | [ubuntu-14.04.5-x86_64](ubuntu-14.04.5-x86_64) | virtualbox-iso | ✅  [OK]| ✅  [OK]| ✅  [OK] | ✅ [OK] | |
| [5](ubuntu-20.04.5-x86_64/build.txt) | [ubuntu-20.04.5-x86_64](ubuntu-20.04.5-x86_64) | virtualbox-iso | ✅  [OK]| ✅  [OK]| ✅  [OK] | ✅ [OK] | |