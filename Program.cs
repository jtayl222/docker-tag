var gitCommitSha = Environment.GetEnvironmentVariable("GIT_COMMIT_SHA") ?? "unknown";
Console.WriteLine($"Git Commit SHA: {gitCommitSha}");
