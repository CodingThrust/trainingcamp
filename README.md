# The Quantum Bay Website

The website is built with [Franklin.jl](https://github.com/tlienart/Franklin.jl). 

## Quick start

To build the website locally, you need to have [Julia](https://book.jinguo-group.science/stable/chap2/julia-setup/) and [Makefile](https://www.gnu.org/software/make/) installed. Then, run the following command:

```bash
make all
```

For deploying to `www.quantumbay.science`, just create a pull request. A comment will appear with a
link to a preview of the website. Once the PR is merged to master, CI will automatically
build the website and deploy to Github pages.

To continue, please check [this issue](https://github.com/CodingThrust/trainingcamp/issues/9).
