# # config/lib.bash
#
# This file sets configuration variables.
#
# ## repositories (array)
#
# Contains the list of repositories to sync.
repositories=(
	git@github.com:whilesmart/trakli-webservice
	git@github.com:whilesmart/trakli-ui
	git@github.com:whilesmart/trakli-mobile
)


#
# ## group: local configuration
#
# If the `./config/local.bash` file exists, we'll read it.

if [[ -f ./config/local.bash ]]; then
	source ./config/local.bash
fi