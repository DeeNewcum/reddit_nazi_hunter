## Reddit Nazi hunter ##

This tool assists the operator in finding Nazis (and other subreddits that are eligible for banning) on Reddit.

As of 30 September 2019, Reddit has [started banning white supremacists and other undesirables](https://www.reddit.com/r/announcements/comments/dbf9nj/changes_to_our_policy_against_bullying_and/).  However, a pattern has emerged — once a subreddit is banned, the users just create another subreddit and, though the new one is much smaller, it's free to grow (until it gets big enough to start attracting unwanted attention).  This tool identifies subreddits much sooner than they otherwise would.

## How it works ##

The tool works hand-in-hand with the operator.  The operator needs to [manually score](weights.txt) some users/subreddits/domains as problematic.  Then the tool explores and identifies other users/subreddits/domains that seem similar to ones that the operator scored.

The tool *does* have the ability to identify some white nationalist content on sight, as there are certain keywords that are uniquely used by white nationalists.
