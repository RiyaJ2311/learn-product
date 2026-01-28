# AI Skills Glossary

This glossary contains key terms used throughout the AI Skills learning modules. Terms are cross-referenced to their relevant modules.

---

## Glossary Table

| Term | Meaning | Usage |
|------|---------|-------|
| **Agent Loop** | The think-act-observe cycle that enables agents to iteratively work toward goals | Module 03 - AI Agents; the fundamental execution pattern for autonomous agents |
| **AI (Artificial Intelligence)** | Computer systems that can perform tasks typically requiring human intelligence, such as understanding language, recognizing patterns, and making decisions | Core concept throughout all modules; refers to the overall technology being studied |
| **AI Agents** | Autonomous AI systems that can perceive their environment, make decisions, and take actions to achieve specific goals | Module 03 - AI Agents; Module 04 - Building Agents; the evolution from simple AI usage to autonomous systems |
| **API (Application Programming Interface)** | A set of protocols that allows different software systems to communicate with each other | Module 02 - AI Skills; used in Tool Use to connect AI agents to external services |
| **Architecture** | The design and structure of AI agent systems, including how components interact and data flows | Module 03 - AI Agents; Module 04 - Building Agents; essential for building scalable agents |
| **Autonomy** | The level of independence an AI agent has in making decisions and taking actions without human intervention | Module 03 - AI Agents; ranges from fully assisted to fully autonomous operation |
| **Cardinality** | The number of unique values in a dataset field; high-cardinality fields have many unique values (like user_id), low-cardinality have few (like user_tier) | Module 04 - Building Agents; important for observability tool selection and cost management |
| **Chain-of-Thought** | A prompting technique where the AI is encouraged to show its reasoning steps before arriving at an answer | Module 02 - AI Skills; improves accuracy for complex reasoning tasks |
| **ChatGPT** | OpenAI's conversational AI product built on the GPT (Generative Pre-trained Transformer) model family | Module 00 - AI Fundamentals; popular example of commercial LLM application |
| **Claude** | Anthropic's conversational AI assistant known for nuanced understanding and helpful responses | Module 00 - AI Fundamentals; another major commercial LLM application |
| **Context** | The amount of information (measured in tokens) that an LLM can consider at once when generating responses | Module 00 - AI Fundamentals; critical for understanding LLM capabilities and limitations |
| **Context Window** | The maximum number of tokens an LLM can process in a single request (input + output combined) | Module 00 - AI Fundamentals; determines how much conversation history or data the model can reference |
| **Conversation Memory** | The message history tracking what was said and done in interactions with an agent | Module 04 - Building Agents; stores the dialogue between user and AI for context continuity |
| **CrewAI** | A framework specifically designed for building and managing multi-agent AI systems | Module 04 - Building Agents; useful when building systems with multiple specialized agents |
| **CRITIC** | An agent pattern where the agent generates output, critiques it, and then revises based on feedback | Module 03 - AI Agents; useful for quality assurance and iterative improvement |
| **Deep Learning** | A subset of machine learning using neural networks with multiple layers to learn complex patterns | Module 00 - AI Fundamentals; the technology underlying LLMs and modern AI systems |
| **Deterministic** | A system property where the same input always produces the exact same output | Module 01 - Rules vs AI; a key factor in deciding between rules-based and AI approaches |
| **Embeddings** | Numerical representations of text (vectors) that capture semantic meaning, enabling similarity comparisons | Module 00 - AI Fundamentals; used in search, RAG, and semantic understanding |
| **Few-shot Learning** | Teaching an AI by providing a small number of examples in the prompt to demonstrate the desired pattern | Module 02 - AI Skills; improves consistency and helps AI understand task requirements |
| **Fine-tuning** | The process of further training a pre-trained model on specific data to specialize it for particular tasks | Module 00 - AI Fundamentals; advanced technique for customizing model behavior |
| **Function Calling** | The ability of LLMs to generate structured requests to execute specific functions or tools | Module 02 - AI Skills; Module 03 - AI Agents; enables AI to take actions beyond text generation |
| **GenAI (Generative AI)** | AI systems that can create new content such as text, images, audio, or video | Module 00 - AI Fundamentals; includes LLMs, image generators like DALL-E, and other creative AI |
| **GPT (Generative Pre-trained Transformer)** | The architecture and model family developed by OpenAI that powers ChatGPT and similar language models | Module 00 - AI Fundamentals; fundamental model architecture in modern AI |
| **Grounding** | Connecting AI outputs to verifiable sources or facts to reduce hallucinations and improve accuracy | Module 00 - AI Fundamentals; critical for building trustworthy AI systems |
| **Hallucination** | When an AI model generates information that sounds plausible but is incorrect or not based on its training data | Module 00 - AI Fundamentals; key limitation to understand when working with LLMs |
| **Honeycomb** | A modern observability platform designed for high-cardinality data and question-driven debugging | Module 04 - Building Agents; pioneered modern observability approach, ideal for AI systems |
| **Hybrid Approach** | Combining rules-based logic and AI to leverage the strengths of both approaches | Module 01 - Rules vs AI; often the optimal solution for complex product features |
| **Inference** | The process of using a trained model to make predictions or generate outputs on new data | Module 00 - AI Fundamentals; the "running" phase of AI models after training |
| **LangGraph** | A framework for building stateful, multi-step AI agent applications with complex workflows | Module 04 - Building Agents; useful for production-grade agent systems |
| **LLM (Large Language Model)** | AI models trained on vast amounts of text data to understand and generate human-like text (e.g., GPT, Claude) | Module 00 - AI Fundamentals; the primary AI technology discussed |
| **Logs** | Text records of events that happened in a system, one of the three pillars of observability | Module 04 - Building Agents; essential for debugging and understanding step-by-step agent behavior |
| **Long-Term Memory** | Persistent storage of knowledge and facts that an agent can access across multiple sessions | Module 04 - Building Agents; enables agents to learn and remember information over time |
| **Memory** | The ability of AI agents to store and recall information across interactions | Module 04 - Building Agents; enables context persistence and learning over time |
| **Metrics** | Numerical measurements of system behavior over time, one of the three pillars of observability | Module 04 - Building Agents; track performance, costs, and health of AI systems |
| **Monitoring** | Checking if a system is working correctly, typically with predefined alerts for known issues | Module 04 - Building Agents; simpler than observability but less flexible for debugging unknown problems |
| **Meta-prompting** | Using AI to help design, optimize, and improve prompts for better results | Module 02 - AI Skills; advanced technique for prompt engineering |
| **ML (Machine Learning)** | A subset of AI where systems learn patterns from data without being explicitly programmed for each task | Module 00 - AI Fundamentals; the foundational technology behind LLMs and modern AI |
| **ML Engineers (Machine Learning Engineers)** | Software engineers who specialize in building, training, and deploying machine learning models | Referenced throughout; professionals you'll collaborate with as an AI-fluent PM |
| **Model** | A trained AI system that takes input and produces output based on patterns learned from training data | Module 00 - AI Fundamentals; the core computational artifact in AI systems |
| **Multi-Agent** | A system where multiple AI agents work together, often with different specializations or roles | Module 03 - AI Agents; more complex architecture for handling diverse tasks |
| **Multimodal** | AI systems that can process and generate multiple types of data (text, images, audio, video) | Module 02 - AI Skills; enables richer interactions beyond text-only |
| **Neural Network** | A computing system modeled after biological neural networks, consisting of interconnected nodes that process information | Module 00 - AI Fundamentals; the foundational architecture for deep learning and LLMs |
| **Observability** | The ability to understand a system's internal state by examining its external outputs (logs, metrics, traces) | Module 04 - Building Agents; enables debugging unknown problems and understanding AI agent behavior |
| **Orchestrator** | The main control loop in an agent system that coordinates between the LLM, tools, and memory | Module 03 - AI Agents; manages the execution flow and decision-making process |
| **Parameters** | The internal numerical values in a neural network that are adjusted during training to make accurate predictions | Module 00 - AI Fundamentals; model size is often measured in parameters (e.g., "175 billion parameters") |
| **Persistence** | The ability to save and restore agent state across sessions or after failures | Module 04 - Building Agents; ensures reliability and continuity in production systems |
| **Plan-and-Execute** | An agent pattern that creates a complete plan upfront, then executes steps sequentially | Module 03 - AI Agents; best for structured tasks with predictable workflows |
| **Production** | The process of deploying AI systems to real-world environments where users interact with them | Module 04 - Building Agents; final stage of building reliable AI features |
| **Prompt** | The input text or instruction given to an LLM to generate a response | Module 00 - AI Fundamentals; Module 02 - AI Skills; the primary way to interact with LLMs |
| **Prompt Chaining** | Breaking complex tasks into multiple sequential prompts where each output feeds into the next | Module 02 - AI Skills; improves reliability and enables validation of intermediate steps |
| **Prompt Engineering** | The systematic approach to designing, testing, and optimizing prompts for better AI outputs | Module 02 - AI Skills; advanced technique for power users and builders |
| **Prompting** | The practice of crafting input text to guide an LLM to produce desired outputs | Module 00 - AI Fundamentals; Module 02 - AI Skills; foundational skill for working with AI |
| **RAG (Retrieval Augmented Generation)** | A technique that combines information retrieval with LLM generation to provide accurate, grounded responses | Module 00 - AI Fundamentals; critical for building AI features that use external knowledge |
| **ReAct (Reasoning + Acting)** | An agent pattern that interleaves thinking, acting, and observing in a dynamic loop | Module 03 - AI Agents; most flexible pattern for handling unpredictable tasks |
| **Reflexion** | An agent pattern where the agent reflects on its mistakes and improves its approach iteratively | Module 03 - AI Agents; particularly effective for coding and tasks with clear success criteria |
| **Rules (Code/Logic)** | Traditional programming using deterministic if-then logic and algorithms | Module 01 - Rules vs AI; the alternative to AI for solving problems |
| **Self-Ask (Decomposition)** | An agent pattern that breaks down complex questions into simpler sub-questions | Module 03 - AI Agents; excellent for research and multi-hop reasoning tasks |
| **Semantic** | Relating to meaning in language; semantic similarity means texts have similar meanings even if worded differently | Module 00 - AI Fundamentals; key concept in embeddings and search |
| **Semantic Retrieval** | A memory strategy that searches and retrieves contextually relevant information from past interactions | Module 04 - Building Agents; enables agents to find relevant information in large histories |
| **Single Agent** | An AI agent that operates independently to complete tasks without delegation to other agents | Module 03 - AI Agents; the simplest agent architecture pattern |
| **Span** | A single operation within a trace, representing one unit of work (e.g., one LLM call or one tool execution) | Module 04 - Building Agents; building block of distributed tracing for understanding system performance |
| **Sliding Window** | A memory management strategy that keeps only the N most recent messages to fit within context limits | Module 04 - Building Agents; simple approach to managing conversation history |
| **State Management** | Tracking an agent's current status, goals, progress, and intermediate results beyond message history | Module 04 - Building Agents; essential for reliable agent execution |
| **Stop Reason** | The condition that signals an agent has completed its task or should halt execution | Module 03 - AI Agents; prevents infinite loops and indicates when a goal is achieved |
| **Subagents** | Specialized AI agents spawned by a main agent to handle specific subtasks or domains | Module 03 - AI Agents; enables delegation and parallel processing in agent systems |
| **Summarization** | A memory strategy that compresses older messages into concise summaries to preserve context | Module 04 - Building Agents; balances context retention with token efficiency |
| **System Prompt** | Permanent instructions included with every AI request that define role, behavior, and output format | Module 02 - AI Skills; sets consistent behavior across all interactions |
| **Temperature** | A parameter controlling randomness in LLM outputs; lower values (0-0.3) are more focused, higher values (0.7-1.0) more creative | Module 00 - AI Fundamentals; Module 02 - AI Skills; key parameter for controlling output style |
| **Tokens** | The basic units of text that LLMs process (roughly ~4 characters or ¾ of a word in English) | Module 00 - AI Fundamentals; fundamental to understanding how LLMs work and their costs |
| **Tool Calling** | The mechanism by which an LLM requests the execution of external functions or APIs | Module 02 - AI Skills; Module 03 - AI Agents; same as Function Calling |
| **Tool Use** | The ability of AI agents to call external functions, APIs, or tools to extend their capabilities | Module 02 - AI Skills; Module 03 - AI Agents; enables agents to interact with external systems |
| **Trace** | The complete journey of a single request through a system, showing all operations from start to finish | Module 04 - Building Agents; one of three pillars of observability, essential for debugging agent flows |
| **Training** | The process of feeding data to an AI model so it learns patterns and can make predictions or generate outputs | Module 00 - AI Fundamentals; how models acquire their capabilities |
| **Transformer** | The neural network architecture that underlies most modern LLMs, enabling parallel processing of sequences | Module 00 - AI Fundamentals; revolutionary architecture introduced in 2017 that powers GPT, Claude, etc. |
| **User Prompt** | The specific request or question submitted by the user in each interaction with an AI system | Module 02 - AI Skills; changes with each interaction unlike the system prompt |
| **Vector** | A mathematical representation of data as an array of numbers; embeddings are vectors that represent text | Module 00 - AI Fundamentals; fundamental data structure in semantic search and embeddings |
| **Vector Database** | A specialized database optimized for storing and searching embeddings based on semantic similarity | Module 00 - AI Fundamentals; infrastructure component for RAG and semantic search features |
| **Workflow Automation** | Using AI to automatically handle sequences of tasks or business processes | Module 03 - AI Agents; practical application of agent systems |
| **Working Memory** | Short-term storage of the current task's goals, plans, and intermediate results | Module 04 - Building Agents; helps agents track progress on active tasks |
| **Zero-shot** | An LLM's ability to perform tasks it wasn't explicitly trained for, based solely on the prompt instructions | Module 02 - AI Skills; demonstrates the generalization capability of large models |

---

## Module Cross-Reference

- **Module 00 - AI Fundamentals**: AI, LLM, Tokens, Context, Context Window, Prompting, Prompt, Embeddings, RAG, ChatGPT, Claude, Model, ML, Deep Learning, Neural Network, GenAI, Training, Inference, Parameters, Fine-tuning, GPT, Transformer, Grounding, Hallucination, Semantic, Vector, Vector Database, Temperature
- **Module 01 - Rules vs AI**: Rules (Code/Logic), Deterministic, Hybrid Approach
- **Module 02 - AI Skills**: Prompt Engineering, Prompting, Prompt, System Prompt, User Prompt, Few-shot Learning, Prompt Chaining, Meta-prompting, Tool Use, Function Calling, Tool Calling, Chain-of-Thought, Multimodal, API, Temperature, Zero-shot
- **Module 03 - AI Agents**: AI Agents, Agent Loop, Single Agent, Multi-Agent, Subagents, Autonomy, ReAct, Plan-and-Execute, Self-Ask, Reflexion, CRITIC, Orchestrator, Stop Reason, Architecture, Workflow Automation, Tool Use, API
- **Module 04 - Building Agents**: Architecture, Memory, Conversation Memory, Working Memory, Long-Term Memory, Sliding Window, Summarization, Semantic Retrieval, State Management, Persistence, Production, LangGraph, CrewAI, Observability, Monitoring, Logs, Metrics, Trace, Span, Honeycomb, Cardinality

---

## Related Files

- Main overview: [README.md](README.md)
- Module 00: [00-AI-Fundamentals/00-Index.md](00-AI-Fundamentals/00-Index.md)
- Module 01: [01-Rules-vs-AI/](01-Rules-vs-AI/)
- Module 02: [02-AI-Skills/](02-AI-Skills/)
- Module 03: [03-AI-Agents/00-Index.md](03-AI-Agents/00-Index.md)
- Module 04: [04-Building-Agents/00-Index.md](04-Building-Agents/00-Index.md)
