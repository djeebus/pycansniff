from distutils.core import setup

setup(
    name='cansniff',
    version='0.0.1',
    install_requires=open('reqs.txt').readlines(),
    entry_points={
        'console_scripts': [
            'cansniff = cansniff.cli:cli'
        ],
    },
)
