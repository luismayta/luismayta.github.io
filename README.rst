|Build Status| |GitHub issues| |GitHub license|

:Version: 0.1.0
:Web: https://github.com/luismayta/luismayta.github.io
:Download: http://github.com/luismayta/luismayta.github.io
:Source: http://github.com/luismayta/luismayta.github.io
:Keywords: luismayta.github.io

.. contents:: Table of Contents:
    :local:


Luismayta.Github.Io
===================

    Source luismayta website

License
-------

The code in this repository is licensed under the MIT unless
otherwise noted.

Please see LICENSE_ for details.

How To Contribute
-----------------

Contributions are very welcome.

Please read `How To Contribute` CONTRIBUTING_ for details.

Issue report template should be automatically applied if you are sending it from github UI as well; otherwise you
can find it at `ISSUE_TEMPLATE.md <https://github.com/luismayta/luismayta.github.io/blob/master/.github/issue_templates/ISSUE_TEMPLATE.md>`_

Reporting Security Issues
-------------------------

Please do not report security issues in public. Please email me@luismayta.site.

Requirements
------------

This is a list of applications that need to be installed previously to
enjoy all the goodies of this configuration:

- `Pyenv`_
- `Docker`_
- `Tfenv`_
- `Terragrunt`_
- `dnsmasq`_
- `terraform-docs`_

or

- `zsh-pyenv`_
- `zsh-docker`_
- `zsh-tfenv`_

Quickstart
----------

Project Start
^^^^^^^^^^^^^

.. code-block:: bash

    $ make setup
    $ make yarn.install

Start Application
^^^^^^^^^^^^^^^^^

.. code:: bash

    $ make yarn.dev


Build
^^^^^

.. code:: bash

    $ make yarn.build stage=prod

Deploy
^^^^^^

.. code:: bash

    $ make aws.deploy


Troubleshooting
---------------

Wrong pre-commit with pyenv
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Execute the next:

.. code:: bash

    pyenv shell 3.8.0

Support
-------

If you want to support this project, i only accept ``IOTA`` :p.

.. code-block:: bash

    Address: FTDCZELEMOQGL9MBWFZENJLFIZUBGMXLFVPRB9HTWYDYPTFKASJCEGJMSAXUWDQC9SJUDMZVIQKACQEEYPEUYLAMMD


Team
----

+---------------+
| |Luis Mayta|  |
+---------------+
| `Luis Mayta`_ |
+---------------+

License
-------

MIT

Changelog
---------

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
------------

Contributions are welcome!

Review the `CONTRIBUTING`_ for details on how to:

* Submit issues
* Submit pull requests

Versioning
----------

Releases are managed using github release feature. We use [Semantic Versioning](http://semver.org) for all
the releases. Every change made to the code base will be referred to in the release notes (except for
cleanups and refactorings).

Credits
-------

-  `CONTRIBUTORS`_

Contact Info
------------

Feel free to contact me to discuss any issues, questions, or comments.

* `Email`_
* `Twitter`_
* `GitHub`_
* `LinkedIn`_
* `Website`_
* `PGP`_

|linkedin| |beacon| |made|

Made with :coffee: and :pizza: by `Luis Mayta`_ and `equipindustry`_.

.. Links
.. _`CHANGELOG`: CHANGELOG.rst
.. _`CONTRIBUTORS`: docs/source/AUTHORS.rst
.. _`CONTRIBUTING`: docs/source/CONTRIBUTING.rst
.. _`LICENSE`: LICENSE

.. _`equipindustry`: https://github.com/equipindustry
.. _`Luis Mayta`: https://github.com/luismayta

.. dependences

.. _`Github`: https://github.com/luismayta
.. _`Linkedin`: https://pe.linkedin.com/in/luismayta
.. _`Email`: slovacus@gmail.com
    :target: mailto:slovacus@gmail.com
.. _`Twitter`: https://twitter.com/slovacus
.. _`Website`: https://luismayta.github.io
.. _`PGP`: https://keybase.io/luismayta/pgp_keys.asc

.. |Build Status| image:: https://travis-ci.org/luismayta/luismayta.github.io.svg
   :target: https://travis-ci.org/luismayta/luismayta.github.io
.. |GitHub issues| image:: https://img.shields.io/github/issues/luismayta/luismayta.github.io.svg
   :target: https://github.com/luismayta/luismayta.github.io/issues
.. |GitHub license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
   :target: LICENSE

.. Team:
.. |Luis Mayta| image:: https://github.com/luismayta.png?size=100
   :target: https://github.com/luismayta

.. Footer:
.. |linkedin| image:: http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png
   :target: https://pe.linkedin.com/in/luismayta
.. |beacon| image:: https://ga-beacon.appspot.com/UA-65019326-1/github.com/luismayta/luismayta.github.io/readme
   :target: https://github.com/luismayta/luismayta.github.io
.. |made| image:: https://img.shields.io/badge/Made%20with-hugo-1f425f.svg
   :target: https://gohugo.io

.. Dependences:

.. _`Pyenv`: https://github.com/pyenv/pyenv
.. _`Docker`: https://www.docker.com/
.. _`Tfenv`: https://github.com/tfutils/tfenv
.. _`Terragrunt`: https://github.com/gruntwork-io/terragrunt
.. _`dnsmasq`: http://www.thekelleys.org.uk/dnsmasq/doc.html
.. _`Terraform-docs`: https://github.com/segmentio/terraform-docs

..
   plugin for zsh

.. _`zsh-nvm`: https://github.com/equipindustry/zsh-nvm
.. _`zsh-pyenv`: https://github.com/luismayta/zsh-pyenv
.. _`zsh-docker`: https://github.com/luismayta/zsh-docker
.. _`zsh-tfenv`: https://github.com/luismayta/zsh-tfenv
