# SharpmaidGithubAction
**SharpmaidGithubAction** is a Github action for creating class diagrams using mermaid from c# entity classes

[Sample Repository](https://github.com/nurzhanme/UmlGenSample)

## Usage

Here is the sample of pipeline

```yml
#need to upload classes to github.workspace - then they are available for SharpmaidGithubAction
- name: Upload File as Artifact
  uses: actions/upload-artifact@v2
  with:
    name: my-artifact
    path: ${{ github.workspace }}
    retention-days: 1


- name: Sharpmaid
  id: generate-UML
  uses: nurzhanme/SharpmaidGithubAction@v0.0.2-alpha
  with:
    entity-path: '<path to the C# entities>'
    uml-file: '<where to write class diagram, for example UML.md>'

# pushing generated file to the repository
- name: Commit UML.md changes.
  id: commit
  run: |
    git config user.name github-actions
    git config user.email github-actions@github.com
    git add .
    git commit -m "generated"
    git push
  shell: bash
```

## Parameters

### `entity-path`

**Required** The path where the entities are located.

### `uml-file`

**Required** File to update. Default to UML.md

## Limitations

- GitHub does not currently support Linux containers hosted on Windows; your CI pipeline must run on Linux.

- If the project is too large, the analysis may time out.
