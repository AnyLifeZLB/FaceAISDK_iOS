## SDK 设置

BUILD_LIBRARY_FOR_DISTRIBUTION YES 为了发布
- 1. 配置SDK为静态库。 built setting 中搜索Mach-o 设置为static lib
- 2. Edit Scheme中配置Build Configuration为Release
- 3. | `Strip Debug Symbols During Copy` | `YES` | 拷贝时剥离调试符号 |
- 4. | `Symbols Hidden by Default` | `YES` | 默认隐藏所有符号 |
- 5. | `Strip Style` | `Non-Global Symbols` | 剥离非全局符号（更激进选`All Symbols`） |
- 6.
- 7.
- 8.
- 9.


