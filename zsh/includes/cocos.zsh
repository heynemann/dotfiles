export COCOS_ROOT=/Applications/Cocos/Cocos2d-x
export COCOS_CURRENT_VERSION_ROOT=$COCOS_ROOT/cocos2d-x-3.14.1

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# these are default paths, they might be different on your setup
export COCOS_CONSOLE_ROOT=$COCOS_CURRENT_VERSION_ROOT/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
# these are default paths, they might be different on your setup
export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# these are default paths, they might be different on your setup
export COCOS_TEMPLATES_ROOT=$COCOS_CURRENT_VERSION_ROOT/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.10.1/bin
export PATH=$ANT_ROOT:$PATH

# Newer NDK requires all dependencies to be present
export APP_ALLOW_MISSING_DEPS=true
