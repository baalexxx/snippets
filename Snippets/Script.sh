#!/bin/sh

#  Script.sh
#  Snippets
#
#  Created by Oleksii Baiev on 18/03/16.
#  Copyright © 2016 baevsoft. All rights reserved.


# Edit an incorrect commit message in Git
#
# http://stackoverflow.com/questions/179123/edit-an-incorrect-commit-message-in-git

git commit --amend -m "New commit message"

# Run Script, Removing 'Created by'

find $PROJECT_DIR -name "*.[hm]" -type f  -exec sed -i '' 's/^\/\/  Created by .*$/\/\//g' {} +