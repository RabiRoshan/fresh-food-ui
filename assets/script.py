# Script to generate icon/image path variables for app_constants.dart

import os

with open("path_variables.txt", "w") as a:

    for path, subdirs, files in os.walk(os.path.dirname(os.path.realpath(__file__))):
        a.write('\n' + str(path) + ':\n')
        for filename in files:
            # f = os.path.join(path, filename)
            if(len(filename.split('.')[0]) != 0 and filename.split('.')[0] != 'script' and filename.split('.')[0] != 'path_variables'):
                a.write('static const String ' + filename.split('.')
                        [0].replace('@', '').replace('-', '_') + ' = path + "' + filename + '";' + os.linesep)
