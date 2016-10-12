# Contributors should write up some reasoning about the PR, rather than just leave a title
if github.pr_body.length < 5
  fail "Please provide a summary in the Pull Request description"
end

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail('Please rebase to get rid of the merge commits in this PR')
end

# Restrict changing only one extension per PR
if git.modified_files.grep(/^Sources\//).count > 1
	fail("Please, modify only one extension per pull request.")
end

# Restrict changing only one test per PR
if git.modified_files.grep(/^EZSwiftExtensionsTests\//).count > 1
	fail("Please, modify only one extension per pull request.")
end

xcode_summary.report 'xcodebuild.json'
