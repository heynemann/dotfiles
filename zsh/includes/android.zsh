if [[ $platform == 'linux' ]]; then
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
  export ANDROID_HOME="${HOME}/Android/Sdk"
  export ANDROID_BIN_PATH="${ANDROID_HOME}/tools/bin"
  export PLATFORM_TOOLS_BIN_PATH="${ANDROID_HOME}/platform-tools"
  export PATH=$ANDROID_BIN_PATH:$PLATFORM_TOOLS_BIN_PATH:$PATH
  export NDK_ROOT="${ANDROID_HOME}/ndk-bundle"
else
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_141.jdk/Contents/Home"
  export ANDROID_HOME=/usr/local/opt/android-sdk
  # Add environment variable NDK_ROOT for cocos2d-x
  #export NDK_ROOT=/Users/heynemann/Library/Android/sdk/ndk-bundle
  #export PATH=$NDK_ROOT:$PATH

  # Add environment variable ANDROID_SDK_ROOT for cocos2d-x
  #export ANDROID_SDK_ROOT=/Users/heynemann/Library/Android/sdk
  #export PATH=$ANDROID_SDK_ROOT:$PATH
  #export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

  # Add environment variable NDK_ROOT for cocos2d-x
  export NDK_ROOT=/usr/local/Cellar/android-ndk/r14
  export PATH=$NDK_ROOT:$PATH

  # Add environment variable ANDROID_SDK_ROOT for cocos2d-x
  export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/24.4.1_1
  export PATH=$ANDROID_SDK_ROOT:$PATH
  export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

  # Add environment variable ANT_ROOT for cocos2d-x
  export ANT_ROOT=/usr/local/Cellar/ant/1.10.1/bin
  export PATH=$ANT_ROOT:$PATH

  export USE_CCACHE=1
  export NDK_CCACHE=/usr/local/bin/ccache
fi

