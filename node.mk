src/version.js: must_rebuild
	echo "// ***** automatically generated. Do not edit! *****" > src/version.js
	echo "export default \"$(final_version)\";" >> src/version.js

src/version.cjs: must_rebuild
	echo "// ***** automatically generated. Do not edit! *****" > src/version.cjs
	echo "module.exports = \"$(final_version)\";" >> src/version.cjs

eslint: node_modules src/version.js
	yarn eslint

fix_eslint: node_modules
	eslint --fix src

node_modules:
	yarn install

clean:
	rm -rf node_modules
	rm -rf dist
	rm -f yarn.lock
