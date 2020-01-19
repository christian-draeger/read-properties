# Read Properties

This is a GitHub action to read from java `.properties` files.

## Inputs

### `path`

**Required** The path to properties file to read.

### `property`

**Required** The property you want to read.

## Outputs

### `value`

The value of the given property.

## Example usage

    - name: Read value from Properties-file
      id: read_property
      uses: christian-draeger/read-properties@1.0.0
      with:
        path: './src/main/resources/application.properties'
        property: 'the.key.of.the.property'
    - name: Do something with your bumped release version
      run: echo ${{ steps.read_property.outputs.value }}
      # will print "the value of 'the.key.of.the.property'"

# License
The scripts and documentation in this project are released under the [MIT License](LICENSE)
