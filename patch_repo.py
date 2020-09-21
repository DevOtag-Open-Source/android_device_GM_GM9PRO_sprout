#!/usr/bin/python
#
# Author: trkzmn (DevOtag)
#
# Require library(ies)
from os import system, path, chdir, getcwd, popen
from json import loads

# Define stuff
class PatchRepo:
    def __init__(self):
        target_file="device/GM/GM9PRO_sprout/targets.json"

        # First parse targets
        print("Parsing targets...")
        self.parse_targets(target_file)
        print("Done.")

        # Make sure that all trees cloned which are needed
        print("Checking device trees...")
        for tree in self.target_trees:
            self.clone_tree(tree)
        print("Done.")

        # Time to cherry-pick
        print("Cherry-pick's started...")
        if not self.target_commits=="":
            keys=self.target_commits.keys()
            for key in keys:
                self.cherry_pick(key)
            print("Done.")
        else:
            print("There is no patch")
        print("All jobs finished successfully. You're ready to building :)")

    def __help__(self):
        print ("""This script should be used in top of rom folder.
Example: $python device/<manufacturer>/<codename>/patch_repo.py""")

    def parse_targets(self, target):
        with open(target) as f:
            lines=f.read()
        lines=loads(lines)
        self.target_github=lines["target_github"]
        self.target_branch=lines["target_branch"]
        self.target_trees=lines["target_trees"]
        self.target_commits=lines["target_commits"]

    def clone_tree(self, target):
        tree_name, tree_path=target.split("|")
        if not path.exists(tree_path):
            cmd="git clone {} -b {} {}".format(self.target_github + tree_name, self.target_branch, tree_path)
            response=system(cmd)
            if response==32768:
                print("Error: Couldn't clone {}".format(tree_name))
                self.__help__()
                quit()

    def cherry_pick(self, target):
        main_dir=getcwd()
        value=self.target_commits[target]
        value_type=type(value)
        patch_list=list()

        if str(value_type)[7:-2]=="list":
            for val in value:
                patch_list.append(val)
        else:
                patch_list.append(value)

        target_dir=target[8:].replace("_", "/")
        if not path.exists(target_dir):
            print("Error: Couldn't find target path {}".format(target_dir))
            self.__help__()
            quit()
        chdir(target_dir)
        cmd="git fetch {} {}".format(self.target_github + target, self.target_branch)
        response=system(cmd)
        if response==32768:
            print("Error: Couldn't fetch {}".format(target))
            self.__help__()
            quit()

        for patch in patch_list:
            cmd="git cherry-pick {}".format(patch)
            response=system(cmd)
            if response==0:
                pass
            elif response==256:
                response=popen("git status").read()
                system("git reset --hard")
                if "modified" in response:
                    print("Error: Please fix conflicts manually !!\n{}:\t{}".format(target, patch))
                    quit()
            else:
                print("Error: Unknown Error !!")
                self.__help__()
                quit()
        chdir(main_dir)

# Main
if __name__=="__main__":
    PatchRepo()
