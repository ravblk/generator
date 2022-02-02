package config

import (
	"fmt"

	"github.com/spf13/viper"
)

const (
	appName        string = "<app-name>"
	defaultCfgPath        = "/etc/" + appName
	defaultCfgName        = appName + ".yaml"
	usageMessage          = "config file (default is " + defaultCfgPath + "/" + defaultCfgName + ")"
)

func NewConfig(cfgFile string) {
	if cfgFile != "" {
		viper.SetConfigFile(cfgFile)
	} else {
		// Search config in home directory with name `appName.yaml`.
		viper.SetConfigType("yaml")
		viper.AddConfigPath(defaultCfgPath)
		viper.SetConfigName(appName)
	}

	viper.AutomaticEnv()

	if err := viper.ReadInConfig(); err == nil {
		fmt.Println("Using config file:", viper.ConfigFileUsed(), usageMessage)
	}
}
