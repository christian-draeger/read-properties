# Read Properties [![CI build](https://github.com/christian-draeger/read-properties/workflows/CI/badge.svg)](https://github.com/christian-draeger/read-properties/actions?query=workflow%3ACI+branch%3Amaster)

This is a GitHub action to read from java `.properties` files.

**Note:** It will work for all file-types that follow the `key=value` pattern.

> If you are also looking for an action that enables you to **write** values to `.properties` files use
> [Write Properties action](https://github.com/christian-draeger/write-properties)


## Inputs

### `path`

**Required** The path to properties file to read.

### `properties`

**Required** The properties you want to read. Space separated

## Outputs

For each provided property, one output of the same name exists. Because the names of outputs can only contain alphanumeric characters, `-` and `_`, any other character is replaced by a `-`.

## Example usage

    - name: Read value from Properties-file
      id: read_property
      uses: christian-draeger/read-properties@1.1.1
      with:
        path: './src/main/resources/application.properties'
        properties: 'the.key.of.a.property the.key.of.another.property'
    - name: Do something with your bumped release version
      run: echo ${{ steps.read_property.outputs.the-key-of-a-property }}
      # will print "the value of 'the.key.of.a.property'"

# License
The scripts and documentation in this project are released under the [MIT License](LICENSE)
