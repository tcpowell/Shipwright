# If you need to clean the project you can run
& 'C:\Program Files\CMake\bin\cmake.exe' --build .\build\x64 --target clean

# Setup cmake project
& 'C:\Program Files\CMake\bin\cmake' -S . -B "build/x64" -G "Visual Studio 17 2022" -T v142 -A x64 -DCMAKE_BUILD_TYPE:STRING=Release

# Extract assets & generate OTR (run this anytime you need to regenerate OTR)
& 'C:\Program Files\CMake\bin\cmake.exe' --build .\build\x64 --target ExtractAssets --config Release

# Compile project
& 'C:\Program Files\CMake\bin\cmake.exe' --build .\build\x64 --config Release

# Copy Files to ootfest config directory
Copy-Item "OTRExporter\oot.otr" -Destination "ootfestConfig\oot.otr" -Force
Copy-Item "x64\Release\soh.exe" -Destination "ootfestConfig\soh.exe" -Force

Pause
