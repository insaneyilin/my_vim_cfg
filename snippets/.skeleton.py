#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
{Description}
"""

from __future__ import print_function
import os
import sys
import argparse


def get_args():
    """
    Get parsed arguments from command line.

    Parameters
    ----------
    None

    Returns
    -------
    Parsed arguments.
    """

    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('infile', help="Input file",
                        type=argparse.FileType('r'))
    parser.add_argument('-o', '--outfile', help="Output file",
                        default=sys.stdout, type=argparse.FileType('w'))

    return parser.parse_args()


def main():
    """
    Main process method.

    Parameters
    ----------
    None

    Returns
    -------
    0(success) or 1(failure)
    """

    args = get_args()
    print(args)
    return 0


if __name__ == '__main__':
    sys.exit(main())
