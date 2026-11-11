<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Module 1: Personal & Estate Foundation - LLB Platform</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-900 min-h-screen flex flex-col justify-between">
    <header class="bg-white shadow-sm border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
            <h1 class="text-xl font-bold text-blue-900">Life's Legacy Blueprint</h1>
            <a href="../index.html" class="text-sm font-medium text-blue-900 hover:underline">← Back to Dashboard</a>
        </div>
    </header>

    <main class="max-w-3xl mx-auto px-4 py-12 flex-grow w-full">
        <div class="bg-white shadow rounded-lg p-8 border border-gray-200">
            <h2 class="text-2xl font-semibold mb-2 text-gray-800">Module 1.0: Personal & Estate Foundation</h2>
            <p class="text-gray-600 mb-6">Establish your core profile details to initialize your legacy blueprint.</p>
            
            <form id="module-form" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Primary Legal Name</label>
                    <input type="text" id="legal-name" required placeholder="Full Legal Name" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Primary Residence (City, State)</label>
                    <input type="text" id="residence" required placeholder="e.g., Jefferson City, MO" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Current Estate Objectives</label>
                    <textarea id="objectives" rows="4" placeholder="Describe your primary estate goals..." class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"></textarea>
                </div>
                <button type="submit" id="save-btn" class="w-full bg-blue-900 text-white font-medium py-2 rounded-lg hover:bg-blue-800 transition">Save Module Data</button>
            </form>
            <div id="message" class="mt-4 text-sm font-medium"></div>
        </div>
    </main>

    <footer class="bg-white border-t border-gray-200 py-4 text-center text-xs text-gray-500">
        © 2026 Griffin Property and Holdings LLC. All rights reserved.
    </footer>

    <script type="module">
        import { supabase } from '../js/supabase-config.js';

        const form = document.getElementById('module-form');
        const messageDiv = document.getElementById('message');
        const saveBtn = document.getElementById('save-btn');

        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            saveBtn.disabled = true;
            saveBtn.textContent = 'Saving...';

            const { data: { session } } = await supabase.auth.getSession();
            if (!session) {
                messageDiv.textContent = 'You must be signed in to save module data.';
                messageDiv.className = 'mt-4 text-sm font-medium text-red-600';
                saveBtn.disabled = false;
                saveBtn.textContent = 'Save Module Data';
                return;
            }

            const payload = {
                legal_name: document.getElementById('legal-name').value,
                residence: document.getElementById('residence').value,
                objectives: document.getElementById('objectives').value
            };

            const { error } = await supabase
                .from('modules_data')
                .upsert({
                    tenant_id: session.user.id,
                    module_number: 1.0,
                    payload: payload,
                    updated_at: new Date()
                }, { onConflict: 'tenant_id,module_number' });

            if (error) {
                messageDiv.textContent = `Error: ${error.message}`;
                messageDiv.className = 'mt-4 text-sm font-medium text-red-600';
                saveBtn.disabled = false;
                saveBtn.textContent = 'Save Module Data';
            } else {
                messageDiv.textContent = 'Module 1 data saved successfully!';
                messageDiv.className = 'mt-4 text-sm font-medium text-green-600';
                saveBtn.disabled = false;
                saveBtn.textContent = 'Save Module Data';
            }
        });
    </script>
</body>
</html>
