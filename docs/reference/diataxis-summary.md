# Diátaxis Summary

Quick reference guide to the Diátaxis documentation framework.

## Overview

Diátaxis identifies four distinct documentation types based on user needs:

| Type | Purpose | When Users Need It |
|------|---------|-------------------|
| **Tutorials** | Learning | "I want to learn" |
| **How-To Guides** | Goals | "I need to accomplish X" |
| **Reference** | Information | "I need to look up Y" |
| **Explanation** | Understanding | "I want to understand Z" |

## The Four Types

### Tutorials (Learning-Oriented)

**Purpose**: Teach newcomers through hands-on learning  
**Focus**: Learning experience, not task completion  
**Structure**: Sequential lessons building skills  

**Characteristics**:

- Start from zero knowledge
- Build confidence through doing
- Provide complete, working examples
- Focus on most important concepts
- Allow safe experimentation

**Example**: "Build your first web app with Django"

### How-To Guides (Task-Oriented)

**Purpose**: Help users accomplish specific tasks  
**Focus**: Practical steps to reach a goal  
**Structure**: Step-by-step instructions  

**Characteristics**:

- Assume basic knowledge
- Address specific use cases
- Provide clear prerequisites
- Offer alternative approaches
- Include troubleshooting

**Example**: "How to deploy to production"

### Reference (Information-Oriented)

**Purpose**: Describe the technical machinery  
**Focus**: Accurate, complete information  
**Structure**: Consistent, predictable format  

**Characteristics**:

- State facts, not opinions
- Be comprehensive
- Use consistent structure
- Optimize for searching
- Include brief examples

**Example**: "API endpoint reference"

### Explanation (Understanding-Oriented)

**Purpose**: Clarify and illuminate topics  
**Focus**: Conceptual understanding  
**Structure**: Discussion and analysis  

**Characteristics**:

- Provide context and background
- Discuss alternatives and trade-offs
- Make connections explicit
- Address the "why"
- Consider different perspectives

**Example**: "Understanding authentication architecture"

## Key Principles

### 1. Separation of Concerns

Each documentation type serves ONE purpose. Don't mix:

- **❌ Tutorials that explain theory** - Keep tutorials focused on hands-on learning
- **❌ How-to guides that teach concepts** - Stick to practical steps
- **❌ Reference with recommendations** - Present facts, not opinions
- **❌ Explanations with instructions** - Discuss concepts without step-by-step guides

### 2. User-Centric Organization

Organize by what users need, not by:

- **Features** - Don't group by product capabilities
- **Chronology** - Don't organize by release date
- **Importance** - Don't prioritize by internal metrics
- **Internal structure** - Don't mirror your code organization

### 3. Clear Navigation

Users should immediately know:

- **What type of documentation they're reading** - Clear labels and consistent structure
- **Where to find what they need** - Intuitive organization and search
- **How documents relate to each other** - Explicit links and cross-references

## Quick Identification Guide

### Is it a Tutorial?

- Teaches through doing ✓
- Assumes no prior knowledge ✓
- Results in new skills ✓
- Has exercises ✓

### Is it a How-To Guide?

- Solves a specific problem ✓
- Lists prerequisites ✓
- Has numbered steps ✓
- Shows how to verify success ✓

### Is it Reference?

- States facts only ✓
- Describes all options ✓
- Uses consistent format ✓
- Optimized for lookup ✓

### Is it Explanation?

- Discusses concepts ✓
- Provides background ✓
- Explores connections ✓
- Answers "why" questions ✓

## Benefits

### For Users

- Find information faster
- Know what to expect
- Choose appropriate content
- Better learning outcomes

### For Writers

- Clear content goals
- Easier planning
- Consistent quality
- Less scope creep

### For Organizations

- Better documentation coverage
- Reduced support burden
- Improved user satisfaction
- Easier maintenance

## Common Mistakes

1. **Tutorial-Reference Hybrid**
   - Problem: Too much detail disrupts learning
   - Solution: Link to reference for details

2. **How-To with Explanations**
   - Problem: Theory interrupts task flow
   - Solution: Link to explanations

3. **Reference with Opinions**
   - Problem: Recommendations don't belong
   - Solution: State facts only

4. **Explanation with Steps**
   - Problem: Instructions confuse understanding
   - Solution: Discuss concepts only

## Implementation Tips

1. **Audit Existing Docs**
   - Categorize current content
   - Identify mixed types
   - Find gaps in coverage

2. **Start Small**
   - Pick one product area
   - Create one of each type
   - Gather feedback

3. **Use Templates**
   - Create standard structures
   - Ensure consistency
   - Speed up writing

4. **Train Writers**
   - Explain the framework
   - Provide examples
   - Review together

## See Also

- [Diátaxis Framework Explained](../explanation/diataxis-framework-explained.md)
- [Documentation Checklists](./documentation-checklists.md)
- [Official Diátaxis Website](https://diataxis.fr/)
