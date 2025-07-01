# The Layered Documentation Framework

The various forms of documentation aren't competing alternatives; they form a cohesive, layered ecosystem. Each type serves a distinct purpose and audience, working together to tell the complete story of your code and systems. The key is understanding what information belongs at each level of abstraction, from the most granular code comment to the highest-level design document.

## Overview

This framework organizes documentation into three primary levels, moving from the code outward:

1. **In the Code** — The "How" and Immediate "Why"
2. **In the Repository** — The "What" and "How to Get Started"
3. **Cross-Cutting & Architectural** — The "Why" at Scale

## Level 1: In the Code — The "How" and Immediate "Why"

This is the documentation most tightly coupled with the implementation, intended for the developer actively working on that specific piece of code.

### Meaningful Names
The first and most fundamental layer of documentation is clean code with meaningful names for variables, functions, classes, and files. Good naming allows the code to convey information that would otherwise require comments.

**Best Practices:**

- Choose names that reveal intent
- Make meaningful distinctions
- Use pronounceable names
- Use searchable names

### Inline Comments
These should be used sparingly to explain the **why**, not the **what**. The code itself shows what it's doing. An inline comment's purpose is to provide context that the code cannot.

**When to use inline comments:**

- Explaining the rationale behind complex logic
- Documenting non-obvious workarounds
- Clarifying business rules or constraints
- Warning about consequences or side effects

### Docstrings (Method & Class Comments)
This is the API contract for a piece of code. A docstring for a function or class should explain how to use it.

**What to include in docstrings:**

- Purpose and behavior
- Parameters and their types
- Return values and types
- Exceptions that might be thrown
- Important restrictions or "gotchas"
- Usage examples for complex APIs

## Level 2: In the Repository — The "What" and "How to Get Started"

This documentation lives within a specific project or service repository and is aimed at developers who need to work on, run, or contribute to that service.

### README.md
This is the front door to your project. For an internal project, its primary audience is a fellow developer, especially a new team member. It should be concise and serve as an entry point.

**Essential README sections:**

- **What**: Project description and problem it solves
- **Why**: Business context and value proposition
- **Getting Started**: Prerequisites, installation, running locally
- **Usage**: Basic examples and common workflows
- **Testing**: How to run tests
- **Contributing**: Guidelines for contributors
- **Support**: Team contacts, Slack channels, issue tracking
- **Documentation**: Links to detailed docs, ADRs, design documents

### ./docs Directory
For documentation that is too long for a README, a dedicated `./docs` directory within the repository is appropriate.

**Common ./docs contents:**

- Detailed setup guides
- API documentation
- Service-specific tutorials
- Deployment and release procedures
- Troubleshooting guides
- Configuration reference

## Level 3: Cross-Cutting & Architectural — The "Why" at Scale

This documentation transcends a single repository and explains how systems are designed and why they are designed that way.

### Architectural Decision Records (ADRs)
An ADR captures a single, significant architectural decision. Its purpose is to create a historical log of the system's evolution.

**ADR Structure:**

1. **Title**: Short descriptive name
2. **Status**: Proposed, Accepted, Deprecated, Superseded
3. **Context**: The issue motivating this decision
4. **Decision**: The architectural choice made
5. **Consequences**: The resulting context after applying the decision

**ADR Best Practices:**

- Number them sequentially (e.g., ADR-001, ADR-002)
- Store in a central, version-controlled location
- Keep them immutable once accepted
- Link related ADRs together

### Design Docs & Architectural Diagrams
These documents provide a broader view of the system's architecture. While ADRs capture single decisions, design documents describe the overall structure.

**Key Components:**

- **Executive Summary**: High-level overview for stakeholders
- **Goals and Non-Goals**: Clear scope definition
- **System Architecture**: Overall design and component interactions
- **C4 Model Diagrams**:
    - Context: System boundaries and external interactions
    - Container: High-level technology choices
    - Component: Internal structure of containers
    - Code: Optional detailed class diagrams

## How They Work Together: A Developer's Journey

These documentation types form a connected web of knowledge that developers navigate based on their current task.

### New Engineer Onboarding Flow

??? details "1. Start with Onboarding Guide"
    - Central index of key resources
    - Team structure and contacts
    - Development environment setup

??? details "2. System Overview"
    - Review Design Docs and C4 Diagrams
    - Understand high-level architecture
    - Learn about system boundaries

??? details "3. Historical Context"
    - Read key Architectural Decision Records
    - Understand why certain choices were made
    - Learn from past trade-offs

??? details "4. First Task Assignment"
    - Navigate to specific service repository
    - Start with README.md for setup
    - Run the service locally

??? details "5. Code Understanding"
    - Read docstrings for API contracts
    - Follow inline comments for complex logic
    - Rely on meaningful names for clarity

??? details "6. Making Changes"
    - Update relevant documentation with code changes
    - Add clarifications where needed
    - Ensure documentation stays current

## Documentation Maintenance

### Integration with Development Workflow
- **Code Reviews**: Include documentation updates
- **Definition of Done**: Documentation requirements
- **Automated Checks**: Linting for missing docstrings
- **Regular Audits**: Quarterly documentation reviews

### Documentation Debt Management
- Track documentation gaps like technical debt
- Allocate time for documentation improvements
- Celebrate documentation contributions
- Make it part of engineering culture

## Benefits

By ensuring each piece of documentation has a clear purpose and audience, this layered approach delivers:

- **Accelerated Onboarding**: New team members can self-serve most information
- **Preserved Knowledge**: Critical decisions and context aren't lost
- **Improved Productivity**: Developers find information quickly
- **Better Decision Making**: Historical context prevents repeated mistakes
- **Reduced Interruptions**: Self-service documentation reduces questions

## Conclusion

Documentation is not a single monolithic entity but a carefully orchestrated system of different types, each serving its unique purpose. By understanding and implementing this layered approach, teams can create documentation that truly serves its users and stands the test of time.