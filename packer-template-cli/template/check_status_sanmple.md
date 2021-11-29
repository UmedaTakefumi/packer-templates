# Building Vagrant base boxes

| Flavor | Builders | buildbox | import box | mkdir directory | vagrant init | build-log | problem |
| ------ | -------- | -------- | -----------| --------------- | -------------| --------- | ------- |
| centos-6.2-x86_64 | virtualbox-iso | ✅  [OK] | ✅ [OK]| ✅ [OK] | ✅ [OK]| [build-log]() |  |
| centos-6.3-x86_64 | virtualbox-iso | ✅  [OK]| ✅ [OK]| 💩 [NotOK] | ✅ [OK] | [build-log]() | [❗ [detail] ](../../centos-6.3-x86_64/problem.md) |
| alpine-standard-3.14.2-x86_64 | virtualbox-iso | ✅ [OK]| ✅ [OK] | ✅  [OK] | ✅  [OK]| [build-log]() | |
| ubuntu-14.04.5-x86_64 | virtualbox-iso | ✅  [OK]| ✅  [OK]| ✅  [OK] | ✅ [OK] | [build-log]() | |