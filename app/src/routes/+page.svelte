<svelte:head>
    <title>Spark Made Easy</title>
</svelte:head>

<body class="h-full bg-zinc-50">
<main class="flex-auto">
    <div class="sm:px-8 my-12 flex">
        <div class="mx-auto bg-white p-16 border rounded-lg">
            <div class="relative px-4 sm:px-8 lg:px-12">
                <div class="mx-auto max-w-2xl lg:max-w-5xl">
                    <div class="max-w-2xl mx-auto tracking-tight text-slate-700">
                        <h1 class="mt-2 text-4xl font-bold tracking-tight text-slate-800 sm:text-5xl dark:text-zinc-100 flex items-center h-14">
                            ⚡ Spark Made Easy
                        </h1>
                        <p class="mt-8 text-base text-slate-700 dark:text-zinc-400 text-pretty">
                            <a class="links"
                               href="https://spark.apache.org/">Apache Spark</a>
                            is an open-source distributed data processing engine.
                            It's designed for writing simple, scalable, data pipelines.
                            You can use Spark with a number of languages like Java, Scala, Python, and R.
                            Please visit the <a class="links">official documentation</a> to learn more about the Spark
                            ecosystem.
                        </p>
                        <p class="mt-6 text-base text-slate-700 dark:text-zinc-400 text-pretty">
                            Spark Made Easy is designed to teach through hands-on examples.
                        </p>
                        <p class="mt-6">
                            <a class="mt-6 text-base font-medium text-teal-500 hover:text-teal-800"
                               href="#free-chapters">Let's get started<span aria-hidden="true">→</span></a>
                        </p>
                        <div>
                            <ol role="list" class="mt-12 space-y-10 sm:space-y-10">
                                <li>
                                    <ol role="list"
                                        class="divide-y divide-slate-300/30 rounded-2xl bg-slate-100 bg-opacity-80 px-6 text-base tracking-tight sm:px-8 sm:py-4">
                                        <li class="flex justify-between py-3"><span class="font-medium text-slate-900">One-click environment setup</span></li>
                                        <li class="flex justify-between py-3"><span class="font-medium text-slate-900">Creating a session</span></li>
                                    </ol>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>

<style>
    .links {
        @apply font-semibold items-start inline-flex underline
    }
</style>