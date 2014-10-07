# ckanops.py

ALL YOUR DATASETS ARE BELONG TO US

## Overview

A collection of everyday tasks on [CKAN](http://ckan.org).

### In the box

1. Update datasets owner
2. Clear datasets licenses
3. Update resources format based on URI extensions
4. Update datasets spatial coverage based on keywords
5. Harvest a DCAT remote source

### TODO

1. Add more spatial coordinates based on keywords
2. Get publication stats from organizations
3. Backup catalogs

#### Usage

Set CKAN host and token

	% export CKAN_HOST='http://192.168.33.20:8080'
	% export CKAN_API_TOKEN='9e21c4ed'

List all datasets

    % python ckanops.py --datasets

Harvest a DCAT source

	% python ckanops.py --harvest <URI>

